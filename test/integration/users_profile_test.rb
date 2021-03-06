require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_match @user.name, response.body
    assert_match @user.microposts.count.to_s, response.body
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.title, response.body
    end
  end

end
