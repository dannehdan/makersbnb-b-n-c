feature "Adding a new room" do
  scenario "A user can add a room to MakersBnB" do
    visit("/rooms/new")
    fill_in("name", with: "Room 1")
    fill_in("description", with: "Lovely room")
    fill_in("rate", with: 150.00)
    select "2021/21/10", from: "Calendar"
    select "2021/25/10", from: "Calendar"
    click_button("Add Room")

    expect(page).to have_content "Room 1"
  end
end
