require "room"

describe Room do
  describe "all" do
    it "returns all rooms" do
      rooms = Room.all

      expect(rooms).to include("Room 1")
      expect(rooms).to include("Room 2")
    end
  end
end
