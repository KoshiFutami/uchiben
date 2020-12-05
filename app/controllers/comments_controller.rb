class CommentsController < ApplicationController
  def create
    @vocab = Vocab.find(params[:vocab_id])
    @comment = @vocab.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to vocab_path(@vocab)
    else
      redirect_to vocab_path(@vocab)
    end
  end

  def destroy
    @vocab = Vocab.find(params[:vocab_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to vocab_path(@vocab)
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
