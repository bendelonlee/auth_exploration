require "rails_helper"

describe 'user signs up' do
  context 'as a new user' do
    it 'displays a form I can use to sign up' do
      name = "Geo"
      email = "123@123.net"
      password = "slkfjwo"

      visit users_path
      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: password

      click_on "Create User"

      expect(current_path).to eq(users_path)

      expect(page).to have_content(name)
      expect(page).to have_content(email)
      expect(page).to_not have_content(password)
    end
  end
end
