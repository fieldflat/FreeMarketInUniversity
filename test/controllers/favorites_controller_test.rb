require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @favorite = Favorite.new(user_id: users(:michael).id, micropost_id: microposts(:ants).id)
  end

  test "should redirect create when not logged in" do
    post favorites_path
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    @favorite.save
    delete favorite_path(@favorite)
    assert_redirected_to login_url
  end

end
