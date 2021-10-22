require "pg"

class Room
  attr_reader :id, :name, :description, :rate, :available_from, :available_to

  def initialize(id:, name:, description:, rate:, available_from:, available_to:)
    @id = id
    @name = name
    @description = description
    @rate = rate
    @available_from = available_from
    @available_to = available_to
  end

  def self.all
    result = Room.connection.exec("SELECT * FROM rooms;")
    result.map do |room|
      Room.new(
        id: room["id"], name: room["name"],
        description: room["description"], rate: room["rate"],
        available_from: room["available_from"], available_to: room["available_to"]
      )
    end
  end

  def self.add(name:, description:, rate:, available_from:, available_to:)
    result = Room.connection.exec_params(
      "INSERT INTO rooms (name, description, rate, available_from, available_to) 
      VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, rate, available_from, available_to;",
      [name, description, rate, available_from, available_to]
    )
    Room.new(
      id: result[0]["id"], name: result[0]["name"],
      description: result[0]["description"], rate: result[0]["rate"],
      available_from: result[0]["available_from"], available_to: result[0]["available_to"]
    )
  end

  def self.find(id:)
    result = Room.connection.exec_params("SELECT * FROM rooms WHERE id = $1::int;", [id])

    Room.new(
      id: result[0]["id"],
      name: result[0]["name"],
      description: result[0]["description"],
      rate: result[0]["rate"],
      available_from: result[0]["available_from"],
      available_to: result[0]["available_to"],
    )
  end

  def self.search(search)
    result = Room.connection.exec_params(
      "SELECT * FROM rooms WHERE (name ILIKE $1) OR (description ILIKE $1);", ["%" + search + "%"]
    )
    result.map do |room|
      Room.new(
        id: room["id"], name: room["name"],
        description: room["description"], rate: room["rate"],
        available_from: room["available_from"], available_to: room["available_to"]
      )
    end
  end

  # :nocov:
  def self.connection
    if ENV["ENVIRONMENT"] == "test"
      PG.connect(dbname: 'makersbnb_test')
    elsif ENV["LOCAL_ENV"] == "local"
      PG.connect(dbname: 'makersbnb')
    else
      PG.connect(ENV['DATABASE_URL'])
    end
  end
  # :nocov:
end
