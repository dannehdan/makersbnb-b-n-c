feature 'Viewing listings' do
  scenario 'The site shows listed rooms' do
    visit('/')
    click_button('View Rooms')
    expect(page).to have_content('Book a space')
  end
end