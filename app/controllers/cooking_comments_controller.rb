class CookingCommentsController < ApplicationController
  def create
    @cooking = Cooking.find(params[:cooking_id])
    @cooking_comment = @cooking.cooking_comments.new(cooking_comment_params)
    @cooking_comment.user_id = current_user.id
    @cooking_comment.save
    redirect_to cooking_path(@cooking.id)
  end

  def destroy
    @cooking = Cooking.find(params[:cooking_id])
    @cooking_comment = CookingComment.find(params[:id])
    @cooking_comment.destroy
    redirect_to request.referer
  end

  private

  def cooking_comment_params
    params.require(:cooking_comment).permit(:comment, :rate)
  end
end
