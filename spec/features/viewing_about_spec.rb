feature "Viewing about spec" do
  scenario "Navigating to about" do
    visit "/"

    click_link "About"
    within("div.top-row") do
      expect(find("h1").text).to eq "About"
    end
  end
end
