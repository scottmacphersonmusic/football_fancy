require "test_helper"

feature "As the site owner, I want to sign out a user to prevent fraud" do
  scenario "log out" do
    # Given a user is signed in
    sign_up
    # When they click log out
    visit "/"
    click_on "Log Out"
    # Then they will be logged out
    save_and_open_page
    page.must_have_content "You need to sign in or sign up before continuing."
  end
end
