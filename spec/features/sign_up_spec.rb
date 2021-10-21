feature 'Signing up' do
  scenario 'user visits site for first time and sees sign up page' do
    visit('/')
    click_button('Sign Up')
    expect(page).to have_content('Sign Up')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
end