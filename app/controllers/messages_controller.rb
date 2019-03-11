class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to room_path(@message.room.id)
    else
      flash[:danger] = "送信できませんでした"
      redirect_to room_path(@message.room.id)
    end
  end

  private

    def message_params
      params.require(:message).permit(:room_id, :from_id, :to_id, :content)
    end

end
