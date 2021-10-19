feature "Viewing rooms" do
  scenario "A user can view rooms" do
    visit("/rooms")

    expect(page).to have_content "Room 1"
    expect(page).to have_content "Room 2"
  end
end
