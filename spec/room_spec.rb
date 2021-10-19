require "room"

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
end
