feature "Viewing images" do
  scenario "viewing 'boat-icon.svg'" do
    visit "/images/boat-icon.svg"
    expect(page).to have_css("svg")
  end
end
