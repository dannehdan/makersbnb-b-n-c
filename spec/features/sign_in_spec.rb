feature "user can sign in" do
  scenario "user signs in successfully" do
    create_user
    visit("/")
    click_link "Login"
    # signed_in_user
    fill_in :email, with: "fake@email.com"
    fill_in :password, with: "password123"

    click_button "Sign In"

    expect(page).to have_content("Welcome, John Smith")
  end

  scenario "user fails to sign in" do
    visit("/")
    click_link "Login"
    fill_in :email, with: "real@email.com"
    fill_in :password, with: "password123"

    click_button "Sign In"

    expect(current_path).to eq "/sessions/new"
  end
end
