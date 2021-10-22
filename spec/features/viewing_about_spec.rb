feature "Viewing about spec" do
  scenario "Navigating to about" do
    visit "/"

    click_link "About"
    expect(page).to have_content("About MakersBnB")
  end
end
