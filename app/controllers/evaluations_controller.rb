class EvaluationsController < ApplicationController
  def new
    @evaluation = Evaluation.new(buyer_id: params[:buyer_id], micropost_id: params[:micropost_id])
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      flash[:success] = "評価をしました！"
      redirect_to root_url
    else
      flash[:danger] = "入力に不備があります。"
      render 'new'
    end
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(:buyer_id, :micropost_id, :value, :comment)
    end

end
