require "rails_helper"
RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it { should validate_uniqueness_of :email }

  describe 'class methods' do

    it '.authenticate' do
      user_1 = User.create(name: "Jam", email: "123@hotmail.com", password: "owiejf")

      actual = User.authenticate( user_1.email , "wofhkjs")
      expect(actual).to be_nil

      actual = User.authenticate( "123asdfasdf", user_1.password )
      expect(actual).to be_nil

      actual = User.authenticate( user_1.email, user_1.password )
      expect(actual).to eq(user_1)

    end

  end
end
