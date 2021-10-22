require "bcrypt"

class User
  attr_reader :name, :id, :email

  def initialize(email:, id:, name:)
    @name = name
    @id = id
    @email = email
  end

  def self.create(email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)

    result = connection.exec_params(
      "INSERT INTO users (email, password, name) VALUES ($1, $2, $3)
      RETURNING id, email, name;",
      [email, encrypted_password, name]
    )

    User.new(
      id: result[0]["id"],
      email: result[0]["email"],
      name: result[0]["name"],
    )
  end

  def self.authenticate(email:, password:)
    result = connection.exec(
      "SELECT * FROM users WHERE email = $1",
      [email]
    )
    return unless result.any?
    return unless BCrypt::Password.new(result[0]["password"]) == password
    User.new(
      id: result[0]["id"],
      email: result[0]["email"],
      name: result[0]["name"],
    )
  end

  private

  # :nocov:
  def self.connection
    if ENV["ENVIRONMENT"] == "test"
      dbname = "makersbnb_test"
    elsif ENV["LOCAL_ENV"] == "local"
      dbname = "makersbnb"
    else
      dbname = ENV["DATABASE_URL"]
    end
    PG.connect(dbname: dbname)
  end
  # :nocov:

end
