feature 'logging out' do
  scenario 'user can log out' do
    visit('/')
    signed_in_user
    click_button('Log out')
    expect(page).to have_link('Login')
    expect(page).not_to have_button('Log out')
  end
end
