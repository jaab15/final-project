Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  # get '/auth/twitter', as: :sign_in_with_twitter
  # get '/auth/twitter/callback' => 'callbacks#twitter'

  resources :users, only: [:create, :new] do
    resources :user_preferences, only: [:create, :destroy]
    resources :user_profile, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :categories, shallow: true do

    resources :topics, only: [:new, :create, :destroy, :index] do
      resources :posts, only: [:new, :create, :destroy, :index] do
        # get :search_posts, on: :collection
        resources :replies, only: [:create, :destroy]
      end

      resources :saletradewants, only: [:create, :new, :index] do
        resources :private_posts, only: [:create, :destroy]
        resources :reply_private_posts, only: [:create, :destroy]
        resources :photos, only: [:create, :destroy]
      end
    end

    # resources :likes, only: [:create, :destroy]
  end

  get  '/topics/search'  => 'topics#search'
  get  '/contact'        => 'home#contact'
  post '/contact_submit' => 'home#contact_submit'

end
