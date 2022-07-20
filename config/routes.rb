Rails.application.routes.draw do
  resources :jams
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get "page/index"
  root to: "page#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
