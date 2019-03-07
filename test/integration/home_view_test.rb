require 'test_helper'

class HomeViewTest < ActionDispatch::IntegrationTest

  # ログインをしていない場合のホームビューレイアウトについて
  test "home view layouts when not logged in" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', signup_path, text: "Sign up"
    assert_select 'a[href=?]', login_path, text: "Log in"
    assert_match "新規登録される方はコチラをクリック", response.body
    assert_match "ログインされる方はコチラをクリック", response.body
  end

  # ログインをしている場合のホームビューレイアウトについて
  test "home view layouts when logged in" do
    user = users(:michael)
    log_in_as(user)
    get root_path
    assert_response :success
  end

end
