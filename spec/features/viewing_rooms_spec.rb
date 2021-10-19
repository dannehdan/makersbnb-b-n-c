require './lib/room'

feature 'Viewing listings' do
  scenario 'The site shows listed rooms page' do
    visit('/')
    click_button('View Rooms')
    expect(page).to have_content('Book a space')
  end

  scenario 'The site shows rooms' do
    add_rooms_to_test_database
    properties = Room.all

    visit('/')
    click_button('View Rooms')
    properties.each do |property|
      expect(page).to have_content(property.name)
      expect(page).to have_content(property.description)
    end
  end
end
