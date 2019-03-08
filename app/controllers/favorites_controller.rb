class FavoritesController < ApplicationController
  before_action :logged_in_user

  def index
    #@feed_items = Micropost.where(user_id: current_user.id).paginate(page: params[:page])
    @feed_items = current_user.fav_microposts.paginate(page: params[:page])
  end

  def create
    Favorite.create!(user_id: current_user.id, micropost_id: params[:micropost_id])
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end
    redirect_to request.referrer || root_url
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end
    redirect_to request.referrer || root_url
  end

end
