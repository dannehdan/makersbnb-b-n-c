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

    result = User.connection.exec_params(
      "INSERT INTO users (email, password, name) VALUES ($1, $2, $3)
      RETURNING id, email, name;",
      [email, encrypted_password, name]
    )

    User.new(
      id: result[0]["id"], email: result[0]["email"], name: result[0]["name"]
    )
  end

  def self.authenticate(email:, password:)
    result = User.connection.exec_params(
      "SELECT * FROM users WHERE email = $1",
      [email]
    )
    return unless result.any?
    return unless BCrypt::Password.new(result[0]["password"]) == password
    User.new(
      id: result[0]["id"], email: result[0]["email"], name: result[0]["name"],
    )
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
