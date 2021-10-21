feature "Signing up" do
  scenario "user visits site for first time and sees sign up page" do
    visit("/")
    click_button("Sign Up")
    expect(page).to have_content("Sign Up")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end

  scenario "User signs up" do
    visit "/"
    click_button "Sign Up"

    expect(current_path).to eq "/users/new"

    fill_in :name, with: "John Smith"
    fill_in :email, with: "fake@email.com"
    fill_in :password, with: "password123"

    click_button "Sign Up"

    expect(page).to have_content "Welcome, John Smith"
  end
end
