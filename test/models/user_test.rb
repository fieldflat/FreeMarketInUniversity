require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example user", email: "fmu.example@a.mbox.nagoya-u.ac.jp", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "name should not be too long (maximum: 50)" do
    @user.name = "a" * 51
    assert_not @user. valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email should not be too long (maximum: 255)" do
    @user.email = "a" * 235 + "@a.mbox.nagoya-u.ac.jp"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user.example@a.mbox.nagoya-u.ac.jp user.example@d.mbox.nagoya-u.ac.jp user.example@v.mbox.nagoya-u.ac.jp
                         first.last@r.mbox.nagoya-u.ac.jp user.example@g.mbox.nagoya-u.ac.jp]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user.example@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo.Bar@a.mbox.nagoya-u.ac.jp"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = "   "
    assert_not @user.valid?
  end

  test "password should not be too short (minimum: 6)" do
    @user.password = @user.password_confirmation ="a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(title: "example title", content: "Lorem ipsum", price: "300円")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end


end
