class CookingsController < ApplicationController
  before_action :login?, only: [:show, :new, :edit] # ログインしていないといけないようにする
  def new
    @cooking = Cooking.new
  end

  def index
    @cookings = Cooking.order("updated_at DESC")
    puts "作成したキー #{ENV['SECRET_KEY']}"
  end

  def create
    @cooking = Cooking.new(cooking_params)
    @cooking.user_id = current_user.id
    if @cooking.save
      redirect_to user_show_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @cooking = Cooking.find(params[:id])
  end

  def update
    @cooking = Cooking.find(params[:id])
    if @cooking.update(cooking_params)
      redirect_to cooking_path(@cooking.id)
    else
      render :edit
    end
  end

  def show
    @cooking = Cooking.find(params[:id])
    @cooking_comment = CookingComment.new
    @cooking_comments = @cooking.cooking_comments
    @bookmark = current_user.bookmarks.find_by(cooking_id: @cooking.id)
    @bookmarks = @cooking.bookmark_users
  end

  def destroy
    @cooking = Cooking.find(params[:id])
    @cooking.destroy
    redirect_to user_show_path(current_user.id)
  end

  def ranking
    @cookings = Cooking.find(CookingComment.group(:cooking_id).order('avg(rate) desc').pluck(:cooking_id))
  end

  private

  def cooking_params
    params.require(:cooking).permit(:cooking_image, :name, :cooking_introduction, :user_id)
  end
end
