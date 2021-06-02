class UsersController < ApplicationController
  before_action :already_login?, only: [:new, :create]
  before_action :login?, only: :show

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save == true
      session[:user_id] = @user.id
      redirect_to user_show_path(@user.id), notice: "新規登録しました"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @cookings = @user.cookings
    @sum = 0
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_show_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :introduction)
  end
end
