Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses
  
  resources :sessions , only: [:create, :destroy]

  resources :users , only: [:create]

  resources :students

  resources :teachers
end
