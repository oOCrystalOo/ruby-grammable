class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @gram = Gram.find_by_id(params[:gram_id])
    return render_status(:not_found) if @gram.blank?
    
    @comment = @gram.comments.create(comment_params.merge(user: current_user))
    if @comment.invalid?
      render :new, status: :unprocessable_entity
    else
      redirect_to root_path
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end
