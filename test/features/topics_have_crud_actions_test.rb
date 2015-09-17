require 'test_helper'

feature "topics have crud actions" do
  scenario "create a new topic" do
    sign_in("scott")
    visit new_topic_path
    # When I submit the form
    fill_in 'Title', with: "D'Andre Yedlin"
    fill_in 'Body', with: "recent move..."
    click_on 'Create Topic'
    # Then a new topic should be created and displayed
    page.must_have_content "Topic was successfully created."
    page.text.must_include "D'Andre Yedlin"
  end

  scenario "edit an existing topic" do
    sign_in("kathryn")
    visit edit_topic_path(topics(:one))
    # When I edit and submit the form
    fill_in 'Title', with: "Clint Dempsey"
    fill_in 'Body', with: "temper tantrum"
    click_on 'Update Topic'
    # Then the topic should be edited and displayed
    page.text.must_include "Topic was successfully updated."
    page.text.must_include "temper tantrum"
  end

  scenario "delete topic" do
    sign_in("scott")
    visit topic_path(topics(:two))
    # When I click destroy
    click_on "Destroy"
    # Then the topic is destroyed
    page.must_have_content "Topic was successfully destroyed."
    page.wont_have_content "large man"
  end
end
