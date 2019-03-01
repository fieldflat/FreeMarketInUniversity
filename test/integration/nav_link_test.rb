require 'test_helper'

class NavLinkTest < ActionDispatch::IntegrationTest

  #
  # ログインしていない場合のナビリンク
  #
  test "nav links when not logged in" do
    get root_path
    assert_select '#navigator .nav-item a[href=?]', root_path, text: 'Home'
    assert_select '#navigator .nav-item a[href=?]', signup_path, text: 'Sign up'
  end

end
