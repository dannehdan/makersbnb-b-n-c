require './lib/room'

feature 'Viewing listings' do
  scenario 'The site shows listed rooms page' do
    visit('/')
    signed_in_user
    click_link('Rooms')
    expect(page).to have_content('Book a space')
  end

  scenario 'The site shows rooms' do
    add_rooms_to_test_database
    properties = Room.all

    visit('/')
    signed_in_user
    click_link('Rooms')
    properties.each do |property|
      expect(page).to have_content(property.name)
      expect(page).to have_content(property.description)
      expect(page).to have_content(property.rate)
    end
  end
end
