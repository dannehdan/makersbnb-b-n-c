feature 'user can sign in' do
  scenario 'user signs in successfully' do
    visit('/')
    signed_in_user
    
    expect(page).to have_content("Welcome, John Smith")
  end

  scenario 'user fails to sign in' do
  end
end