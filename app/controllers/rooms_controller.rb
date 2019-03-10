class RoomsController < ApplicationController

  def index
    @rooms = Room.where(buyer_id: current_user.id)
  end

  def show

  end

  def create
    @room = Room.new(buyer_id: current_user.id, micropost_id: params[:micropost_id])
    if @room.save
      flash[:success] = "商品を購入しました！"
      redirect_to rooms_url
    else
      flash[:danger] = "商品を購入できませんでした"
      redirect_to root_url
    end
  end

  def destroy

  end

end
