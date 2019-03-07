require 'test_helper'

class UsersDestroyTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "current_user can delete his account" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    delete user_path(@user)
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'static_pages/home'
    assert_not flash.empty?
  end

end
