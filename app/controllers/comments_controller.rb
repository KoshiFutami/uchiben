class CommentsController < ApplicationController
  def create
    @vocab = Vocab.find(params[:vocab_id])
    @comment = @vocab.comments.new(comment_params)
    @comment.user_id = current_user.id

    # if @comment.save
    #   # redirect_to user_vocab_path(@vocab.user, @vocab)
    #   flash[:notice] = 'コメントが投稿されました。'
    #   redirect_back(fallback_location: root_path)
    # else
    #   # redirect_to user_vocab_path(@vocab.user, @vocab)
    #   redirect_back(fallback_location: root_path) 
    # end

    # ajaxで書き換え
    @comment.save!


  end

  def destroy
    @vocab = Vocab.find(params[:vocab_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    # redirect_to user_vocab_path(@vocab.user, @vocab)
    redirect_back(fallback_location: root_path) 
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
