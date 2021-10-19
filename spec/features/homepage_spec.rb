feature "Homepage" do
  scenario "A user visits the homepage" do
    visit("/")
    expect(page).to have_content "Welcome to Makers BnB!"
  end
end
