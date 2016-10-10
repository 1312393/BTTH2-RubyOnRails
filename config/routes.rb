Blog::Application.routes.draw do
  resources :follows

  resources :articles do
    resources :comments
  end
  devise_for :users
  resources :friendships
  resources :follows
  root 'articles#index'
end
