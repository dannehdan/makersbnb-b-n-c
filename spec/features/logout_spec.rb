feature 'logging out' do
  scenario 'user can log out' do
    visit('/')
    signed_in_user
    expect(page).to have_link('Logout')
    find("#logout-btn", visible: false).click

    expect(page).to have_link('Login')
    expect(page).not_to have_link('Logout')
  end
end
