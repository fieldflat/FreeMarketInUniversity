require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post signup_path, params: {user: {
          name: "",
          email: "invalid@foo.com",
          password: "qwe",
          password_confirmation: "rty"
        }}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post signup_path, params: {user: {
          name: "Success",
          email: "success.email@a.mbox.nagoya-u.ac.jp",
          password: "foobar",
          password_confirmation: "foobar"
        }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

end
