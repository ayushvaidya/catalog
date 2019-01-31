Rails.application.routes.draw do

  devise_for :users

  root 'categories#index'

  resources :categories, param: :slug

  resources :posts, param: :slug, :path => "/tracks"

  resources :posts do
    resources :comments

    collection do
      patch :sort
    end
  end

  resources :users, only: [:show]

end
