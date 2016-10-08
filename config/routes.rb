Blog::Application.routes.draw do
  devise_for :users
  resources :friendships
  resources :articles do
    resources :comments
  end
  root 'articles#index'
end
