feature "Adding a new room" do
  scenario "A user can add a room to MakersBnB" do
    visit("/")
    signed_in_user
    visit("/rooms/new")
    fill_in("name", with: "Room 1")
    fill_in("description", with: "Lovely room")
    fill_in("rate", with: 150.00)
    fill_in("start_date", with: "2021-10-21")
    fill_in("end_date", with: "2021-10-25")
    click_button("Add Room")

    expect(page).to have_content "Room 1"
  end
end
