# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    resource  :contacts, only: %i[new create], path_names: { new: '' }

    resources :articles do
      resources :comments, except: %i[show]
    end

    root to: 'articles#index'

    get 'terms' => 'pages#terms'
    get 'about' => 'pages#about'
  end
end
