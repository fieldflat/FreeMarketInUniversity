require 'test_helper'

class FavoriteSystemTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @micropost = microposts(:post_1)
    log_in_as(@user)
  end

  test "valid user can favorite and unfavorite" do
    assert_difference 'Favorite.count', 1 do
      post favorites_path(micropost_id: @micropost.id)
    end
    follow_redirect!
    @favorite = Favorite.find_by(user_id: @user.id, micropost_id: @micropost.id)
    assert_difference 'Favorite.count', -1 do
      delete favorite_path(@favorite)
    end
  end

  test "micropost destroy when valid user destroyed" do
    @user.destroy
    Micropost.all.each do |micropost|
      assert_not micropost.user == @user
    end
  end

  test "favorite index page should contain only favorited micropost" do
    get favorites_path
    assert_template 'favorites/index'
    @feed_items = assigns(:feed_items)
    @feed_items.each do |feed|
      assert @user.fav_microposts.include?(feed)
    end
  end

end
