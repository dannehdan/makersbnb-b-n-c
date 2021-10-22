require "pg"

def setup_test_database
  connection = PG.connect(dbname: "makersbnb_test")
  connection.exec("TRUNCATE rooms;")
  connection.exec("TRUNCATE users;")
end

def add_rooms_to_test_database
  connection = PG.connect(dbname: "makersbnb_test")
  connection.exec("INSERT INTO rooms (name, description, rate, available_from, available_to) VALUES ('Room 1', 'This is a room.', 150, '2021-10-22', '2021-10-23');")
  connection.exec("INSERT INTO rooms (name, description, rate, available_from, available_to) VALUES('Room 2', 'This is a room too.', 160, '2021-10-22', '2021-10-24');")
end
