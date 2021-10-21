require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE rooms;")
end

def add_rooms_to_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO rooms (name, description, rate) VALUES ('Room 1', 'This is a room.', 10);")
  connection.exec("INSERT INTO rooms (name, description, rate) VALUES('Room 2', 'This is a room too.', 15);")

end
