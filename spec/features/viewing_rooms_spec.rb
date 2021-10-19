<<<<<<< HEAD
feature "Viewing rooms" do
  scenario "A user can view rooms" do
    add_rooms_to_test_database
    visit("/rooms")

    expect(page).to have_content "Room 1"
    expect(page).to have_content "Room 2"
  end
end
=======
feature 'Viewing listings' do
  scenario 'The site shows listed rooms page' do
    visit('/')
    click_button('View Rooms')
    expect(page).to have_content('Book a space')
  end

  scenario 'The site shows rooms' do
    properties = [
      {id: 1, name: "Property 1", description: "This is a property"},
      {id: 2, name: "Property 2", description: "This is a property"},
      {id: 3, name: "Property 3", description: "This is a property"}
    ]
    visit('/')
    click_button('View Rooms')
    properties.each do |property|
      expect(page).to have_content(property[:name])
      expect(page).to have_content(property[:description])
    end
  end
end
>>>>>>> main
