require "rails_helper"
describe 'user is logged in' do
  it 'they click log out and are logged out' do
    user_1 = User.create(name: "Bo", email: "123@123.io", password: "23oriuwf")

    visit users_path


    click_on "Log in"

    fill_in "login_info[email]", with: user_1.email
    fill_in "login_info[password]", with: user_1.password

    click_on "Log in"

    expect(page).to have_content("You are logged in as #{user_1.name}")


    click_on "Log out"

    expect(page).to have_content("You are logged out")

  end

end
