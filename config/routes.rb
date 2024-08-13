# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'articles#index'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resource  :contacts, only: %i[new create], path_names: { new: '' }

  resources :articles do
    resources :comments, except: %i[show]
  end
end
