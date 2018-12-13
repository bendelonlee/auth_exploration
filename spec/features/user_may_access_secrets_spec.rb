describe 'user may access secrets' do
  context 'as a logged in user when I visit the secret path' do
    it 'displays the secrets' do
      secret_1 = Secret.create(title: "I can't tell you", body: "Harry and Sally cheated")
      user_1 = User.create(name: "Bo", email: "123@123.io", password: "23oriuwf")
      visit users_path
      click_on "Log in"

      fill_in "login_info[email]", with: user_1.email
      fill_in "login_info[password]", with: user_1.password

      click_on "Log in"

      visit '/secrets'

      expect(page).to have_content(secret_1.title)
      expect(page).to have_content(secret_1.body)
    end
  end
  context 'as a user that is not logged in' do
    it 'brings me to the login page if I want to view the secrets' do
      secret_1 = Secret.create(title: "I can't tell you", body: "Harry and Sally cheated")

      visit '/secrets'

      expect(current_path).to eq(login_path)

      expect(page).to_not have_content(secret_1.title)
    end
  end
end
