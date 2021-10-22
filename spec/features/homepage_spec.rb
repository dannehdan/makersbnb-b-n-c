feature "Homepage" do
  scenario "A user visits the homepage" do
    visit("/")
    expect(page).to have_content "MakersBnB"
  end

  scenario "User tries to navigate page without signing in" do
    visit "/"
    click_link "Rooms"
    expect(current_path).to eq "/sessions/new"
  end
end
