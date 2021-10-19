feature "Viewing rooms" do
  scenario "A user can view rooms" do
    add_rooms_to_test_database
    visit("/rooms")

    expect(page).to have_content "Room 1"
    expect(page).to have_content "Room 2"
  end
end
