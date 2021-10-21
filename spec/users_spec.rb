require './lib/user'

describe User do
  let(:name) { double :name }
  let(:password) { double :password }

  describe 'initialize' do
    it 'should create a user with an email and password' do
      user = User.new(name, password)
      expect(user.name).to eq(name)
      expect(user.password).to eq(password)
    end
  end
end