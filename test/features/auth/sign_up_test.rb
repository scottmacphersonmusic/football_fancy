require "test_helper"

feature "sign up - authenticate" do
  scenario "user can sign up" do
    visit "/"
    click_on "Sign Up"
    fill_in "Email", with: "donald@trump.sad"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign Up"
    page.must_have_content "Welcome! You have signed up successfully!"
  end
end
