# frozen_string_literal: true

require 'sidekiq/web'

class AdminConstraint
  def matches?(request)
    user = request.env['warden'].user # Получаем текущего пользователя через Warden

    return false unless user

    user.admin_role?
  end
end

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users

    resource  :contacts, only: %i[new create], path_names: { new: '' }

    resources :articles do
      resources :comments, except: %i[show]
    end

    namespace :admin, constraints: AdminConstraint.new do
      resources :users
    end

    root to: 'articles#index'

    get 'terms' => 'pages#terms'
    get 'about' => 'pages#about'
  end
end