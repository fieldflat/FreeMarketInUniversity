class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.update_attributes(user_params)
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      flash[:success] = "ログインしました！"
      redirect_back_or @user
    else
      flash.now[:danger] = "Email 又は パスワードが間違っています."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました！"
    redirect_to root_url
  end

  private

    def user_params
      params.require(:session).permit(:email, :password)
    end

end
