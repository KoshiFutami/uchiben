class CommentsController < ApplicationController
  def create
    @vocab = Vocab.find(params[:vocab_id])
    @comment = @vocab.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to user_vocab_path(@vocab.user, @vocab)
    else
      redirect_to user_vocab_path(@vocab.user, @vocab)
    end
  end

  def destroy
    @vocab = Vocab.find(params[:vocab_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_vocab_path(@vocab.user, @vocab)
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
