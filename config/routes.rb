Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :categories
  resources :posts, :path => "/shortcuts"
  resources :posts do
    collection do
      patch :sort
    end
  end

  resources :users, only: [:show]

end
