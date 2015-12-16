require 'test_helper'

class UserCanSeeProfileDetailsTest < ActionDispatch::IntegrationTest

  test "user sees list of tweets after logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/home", current_path
    # assert page.has_content?("@ColeMersich")
    # assert page.has_content?("@BenMorganIO taught me how to tweet with the Twitter API!")
    # assert page.has_content?("")
    # assert page.has_content?("")
save_and_open_page
    assert page.has_link?("logout")
  end
end
