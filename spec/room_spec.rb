require "room"
require "database_helpers"

describe Room do
  describe "all" do
    it "returns all rooms" do
      add_rooms_to_test_database
      rooms = Room.all

      expect(rooms[0].name).to eq "Room 1"
      expect(rooms[0].description).to eq "This is a room."
      expect(rooms[1].name).to eq "Room 2"
      expect(rooms[1].description).to eq "This is a room too."
    end
  end
  describe "add" do
    it "adds a new room" do
      room = Room.add(name: "Room 1", description: "This is a room.")
      persisted_data = persisted_data(id: room.id)

      expect(room.name).to eq "Room 1"
      expect(room.description).to eq "This is a room."
      expect(room).to be_a Room
      expect(room.id).to eq persisted_data["id"]
    end
  end
end
