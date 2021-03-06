class RoomsController < ApplicationController

  def index
    @rooms = current_user.my_room
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new(from_id: current_user.id, to_id:@room.micropost.user)
    @messages = Message.where(room_id: @room.id)
    respond_to do |format|
      format.html # html形式でアクセスがあった場合は特に何もなし(@messages = Message.allして終わり）
      format.json { @new_message = Message.where('id > ? and room_id = ? and to_id = ?', params[:message][:id], @room.id, current_user.id) } # json形式でアクセスがあった場合は、params[:message][:id]よりも大きいidがないかMessageから検索して、@new_messageに代入する
    end
  end

  def create
    @room = Room.new(buyer_id: current_user.id, micropost_id: params[:micropost_id])
    if @room.save
      Message.create(room_id: @room.id, from_id: @room.buyer_id, to_id: @room.micropost.user.id, content: "購入します。よろしくお願いします。")
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
