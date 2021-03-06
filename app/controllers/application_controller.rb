class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済のユーザーのみアクセス可能に
  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :sidebar


  def sidebar
    @learning_ranks = Vocab.create_learning_ranks

    @user_ranks = User.create_user_ranks

    @todays_vocabs = Vocab.where(created_at: Time.now.all_day)
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :profile, :avatar])
    end

end
