class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_show_path(user.id), notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "ログアウトしました"
  end
end
