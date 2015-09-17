ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...

  def sign_up
    visit "/"
    click_on "Sign Up"
    fill_in "Email", with: "donald@trump.sad"
    fill_in "Password", with: "thedonald"
    fill_in "Password confirmation", with: "thedonald"
    click_on "Sign up"
  end

  def sign_in(user_name)
    user = users(user_name.to_sym)
    visit new_user_session_path
    fill_in :Email, with: user.email
    fill_in :Password, with: "password"
    click_on "Log in"
  end
end
