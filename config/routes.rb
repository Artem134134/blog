Rails.application.routes.draw do
  devise_for :users

  root to: "articles#index"

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resource  :contacts, only: %i[new create], path_names: {new: ''}
  
  resources :articles do 
    resources :comments, only: %i[new create destroy]
  end
  
end
