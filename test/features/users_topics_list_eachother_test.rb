require "test_helper"

feature "contributors topics list eachother" do
  scenario "topic lists users who contributed" do
    # Given an authenticated user
    sign_in("scott")
    # When they contribute to a topic
    visit edit_topic_path(topics(:one))
    fill_in "Title", with: "Stefan Frei is amazing"
    click_on "Update Topic"
    # Then their show page lists that topic
    page.must_have_content "Topic was successfully updated."
    page.must_have_content "Stefan Frei is amazing"
    page.must_have_content("scomo@example.com", count: 1)
    # Do it again to verify the email only gets shown once
    visit edit_topic_path(topics(:one))
    fill_in "Title", with: "Stefan Frei is still amazing"
    click_on "Update Topic"
    page.must_have_content "Stefan Frei is still amazing"
    page.must_have_content("scomo@example.com", count: 1)
  end

  scenario "users list topics they've contributed to" do
    # Given a user who has contributed
    sign_in("scott")
    visit edit_topic_path(topics(:one))
    fill_in "Title", with: "Stefan Frei is amazing"
    click_on "Update Topic"
    # When I visit that contributors show page
    visit contributor_path(users(:scott))
    # Then it lists the topics they've contributed to
    page.must_have_content "Stefan Frei is amazing"
    # Do it again to verify the topic title is only listed once
    visit edit_topic_path(topics(:one))
    fill_in "Title", with: "Stefan Frei is still amazing"
    click_on "Update Topic"
    visit contributor_path(users(:scott))
    save_and_open_page
    page.must_have_content("Stefan Frei is still amazing", count: 1)
  end
end
