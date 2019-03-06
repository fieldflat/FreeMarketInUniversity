require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(title: "Example title", content: "Example content", price: "3000円")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "title should be present" do
    @micropost.title = "  "
    assert_not @micropost.valid?
  end

  test "title should not be too long(maximum: 60)" do
    @micropost.title = "a" * 61
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should not be too long(maximum: 200)" do
    @micropost.content = "a" * 201
    assert_not @micropost.valid?
  end

  test "user_id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

  test "price should be present" do
    @micropost.price = "   "
    assert_not @micropost.valid?
  end


end
