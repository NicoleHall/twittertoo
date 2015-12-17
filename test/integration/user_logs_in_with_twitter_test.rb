require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "logging in" do
    setup
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/home", current_path
    # assert page.has_content?("@ColeMersich")
    # assert page.has_link?("logout")
  end


end
