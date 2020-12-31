class LearningsController < ApplicationController
  def create
    @vocab = Vocab.find_by(id: params[:vocab_id])
    learning = current_user.learnings.build(vocab_id: params[:vocab_id])
    learning.save!
    # redirect_to root_path
    # redirect_to(:back)
  end

  def destroy
    @vocab = Vocab.find_by(id: params[:vocab_id])
    current_user.learnings.find_by(vocab_id: params[:vocab_id]).destroy!
    # redirect_to root_path
    # redirect_to(:back)
  end
end
