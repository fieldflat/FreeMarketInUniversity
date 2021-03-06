class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @evaluations = current_user.evaluations
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録に成功しました！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を編集しました．"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    log_out
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_url
  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image)
   end


   # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = "権限がありません"
      redirect_to(root_url)
    end
  end

end
