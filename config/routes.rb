Blog::Application.routes.draw do
  resources :articles do
    resources :comments
  end
  devise_for :users
  resources :friendships

  root 'articles#index'
end
