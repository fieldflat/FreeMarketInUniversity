class FavoritesController < ApplicationController
  before_action :logged_in_user

  def index
    @feed_items = current_user.fav_microposts.paginate(page: params[:page])
  end

  def create
    @favorite = Favorite.create!(user_id: current_user.id, micropost_id: params[:micropost_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.js
    end
  end

end
