class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    Favorite.create!(user_id: current_user.id, micropost_id: params[:micropost_id])
    redirect_to request.referrer || root_url
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to request.referrer || root_url
  end

end
