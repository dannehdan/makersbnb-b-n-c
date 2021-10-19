require "pg"

class Room

attr_reader :id, :name, :description

  def initialize(id:, name:, description: )
    @id = id
    @name = name
    @description = description
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec('SELECT * FROM rooms;')
    result.map do |room|
      Room.new(id: room['id'], name: room['name'], description: room['description'])
    end
  end

end
