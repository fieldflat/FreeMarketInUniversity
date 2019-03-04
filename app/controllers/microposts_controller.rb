class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(microposts_params)
    if @micropost.save
      flash[:success] = "出品しました！"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy

  end

  private

    def microposts_params
      params.require(:micropost).permit(:title, :content)
    end

end
