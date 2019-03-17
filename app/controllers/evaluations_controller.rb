class EvaluationsController < ApplicationController
  def new
    @evaluation = Evaluation.new(from_id: current_user.id, to_id: params[:to_id], micropost_id: params[:micropost_id])
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      if Evaluation.where(micropost_id: @evaluation.micropost.id).count == 2
        Room.find_by(micropost_id: @evaluation.micropost.id).destroy
      end
      flash[:success] = "評価をしました！"
      redirect_to root_url
    else
      flash[:danger] = "入力に不備があります。"
      render 'new'
    end
  end

  private

    def evaluation_params
      params.require(:evaluation).permit(:from_id, :to_id, :micropost_id, :value, :comment)
    end

end
