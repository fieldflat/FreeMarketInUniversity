require 'test_helper'

class NavLinkTest < ActionDispatch::IntegrationTest

  #
  # ログインしていない場合のナビリンク
  #
  test "nav links when not logged in" do
    get root_path
    assert_select '#navigator .nav-item a[href=?]', root_path, text: 'Home'
    assert_select '#navigator .nav-item a[href=?]', signup_path, text: 'Sign up'
    assert_select '#navigator .nav-item a[href=?]', login_path, text: 'Log in'
  end

  test "nav links when logged in" do
    user = users(:michael)
    log_in_as(user)
    get root_path
    assert_select '#navigator .nav-item a[href=?]', users_path, text: 'Users'
    assert_select '#navigator .nav-item a[href=?]', user_path(user), text: 'Profile'
    assert_select '#navigator .nav-item a[href=?]', edit_user_path(user), text: 'Edit'
    assert_select '#navigator .nav-item a[href=?]', new_micropost_path, text: 'New'
    assert_select '#navigator .nav-item a[href=?]', logout_path, text: 'Logout'
  end

end
