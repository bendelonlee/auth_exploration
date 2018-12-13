require "rails_helper"
describe 'existing user visits the log in page' do
  it 'displays a form that logs them in to the site' do
    user_1 = User.create(name: "Bo", email: "123@123.io", password: "23oriuwf")
    visit users_path

    # expect(page).to have_content("You are logged out")

    click_on "Log in"

    fill_in "login_info[email]", with: user_1.email
    fill_in "login_info[password]", with: user_1.password


    click_on "Log in"

    save_and_open_page

    expect(page).to have_content("You are logged in as #{user_1.name}")

  end

end
