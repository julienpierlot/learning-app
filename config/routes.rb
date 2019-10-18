Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    resources :comments
  end

  resources :topics

  root 'welcome#index'

  resources :events

  resources :participants, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
