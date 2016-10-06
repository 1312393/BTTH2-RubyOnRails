Blog::Application.routes.draw do
  resources :articles do
    resources :comments
  end
  root 'articles#index'
end
