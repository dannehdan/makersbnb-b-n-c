require "pg"
require "./lib/user"

def persisted_data(id:)
  connection = PG.connect(dbname: "makersbnb_test")
  result = connection.query("SELECT * FROM rooms WHERE id = #{id};")
  result.first
end

def signed_in_user
  User.create(name: "John Smith", email: "fake@email.com", password: "password123")
  click_link("Login")
  fill_in("email", with: "fake@email.com")
  fill_in("password", with: "password123")
  click_button("Sign In")
end
