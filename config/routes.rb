Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:create, :destroy]
  end


  resources :posts do 
    resources :likes, only: [:create]
  end

  get 'api/v1/posts', to: "api_posts#return_posts"
  get 'api/v1/posts/:post_id/comments', to: "api_comments#return_comments"
  post 'api/v1/posts/:post_id/comments', to: "api_comments#create_comment"
end
end