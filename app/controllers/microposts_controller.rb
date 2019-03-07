class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :show, :edit, :create, :destroy, :update]
  before_action :correct_user, only: [:edit, :destroy, :update]

  def new
    @micropost = current_user.microposts.build
  end

  def show
    @micropost = Micropost.find(params[:id])
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

  def edit

  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost Deleted!!"
    redirect_to request.referrer || root_url
  end

  def update
    if @micropost.update_attributes(microposts_params)
      flash[:success] = "編集しました！"
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  private

    def microposts_params
      params.require(:micropost).permit(:title, :content, :price)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
