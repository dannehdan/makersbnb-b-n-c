feature 'view individual room' do 
  scenario 'users sees details of individual room' do
    room = Room.add(name: "Room 1", description: "This is a room")
    visit("/rooms/#{room.id}")
    expect(page).to have_content "Room 1"
  end
end
        