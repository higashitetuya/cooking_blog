class LikesController < ApplicationController
  def create
    @cooking = Cooking.find(params[:cooking_id])
    @like = current_user.likes.new(cooking_id: @cooking.id)
    @like.save
    redirect_to request.referer
  end

  def destroy
    @cooking = Cooking.find(params[:cooking_id])
    @like = current_user.likes.find_by(cooking_id: @cooking.id)
    @like.destroy
    redirect_to request.referer
  end
end
