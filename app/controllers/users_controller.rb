class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @vocabs = Vocab.where(user_id: @user.id).recent
    # @vocabs = @user.vocabs.all.recent
    @learnings = Learning.where(user_id: @user.id).recent
  end

end
