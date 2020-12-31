Rails.application.routes.draw do
  # root 'vocabs#index'
  # get 'home/index'
  # devise_for :users

  # devise_scope :user do
  #   post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  # end

  # resources :users, path: '/', only: [:show]

  # resources :vocabs do
  #   collection do
  #     get :search
  #     get :learnings
  #   end
  #   resource :learnings, only: %i[create destroy]
  #   resources :comments, only: [:create, :destroy]
  # end


  root 'vocabs#index'
  get 'home/index'
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # resources :users, path: '/', only: [:show]

  resources :users, path: '/', only: [:show] do
    resources :vocabs do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :vocabs do
    collection do
      get :search
      # get :learnings
    end
    resource :learnings, only: [:create, :destroy]
    # resources :comments, only: [:create, :destroy]
  end

end
