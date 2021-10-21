feature "filtering rooms" do
  scenario "user can search rooms by name/description" do
    room = Room.add(name: "Room 1", description: "This is a room", rate: 150, available_from: "2021-10-21", available_to: "2021-10-22")
    visit("/rooms")
    fill_in "search", with: "room"
    click_button "Search"
    expect(page).to have_content "room"
  end
end
