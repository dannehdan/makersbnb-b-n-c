feature "view individual room" do
  scenario "users sees details of individual room" do
    room = Room.add(name: "Room 1", description: "This is a room", rate: 150, available_from: "2021-10-21", available_to: "2021-10-22")
    visit("/rooms/#{room.id}")
    expect(page).to have_content "Room 1"
  end
end
