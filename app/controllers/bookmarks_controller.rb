class BookmarksController < ApplicationController
  before_action :login?, only: [:index]

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @bookmark = current_user.bookmarks.create(cooking_id: params[:cooking_id])
    flash[:success] = "この投稿をお気に入りに登録しました"
    redirect_to cooking_path(@bookmark.cooking.id)
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    flash[:danger] = "この投稿のお気に入りを解除しました"
    redirect_to cooking_path(@bookmark.cooking.id)
  end
end
