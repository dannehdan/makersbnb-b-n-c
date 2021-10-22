require './lib/user'

describe User do
  let(:name) { double :name }
  let(:password) { double :password }
  let(:email) { double :email }

  describe '.create' do
    it 'should add a new user to the database' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      user = User.create(email: 'fake@email.com', password: 'password123', name: 'John Smith')
      expect(user.name).to eq('John Smith')
      expect(user.email).to eq('fake@email.com')
    end
  end
end
