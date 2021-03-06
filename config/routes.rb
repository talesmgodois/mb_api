Rails.application.routes.draw do

  apipie
  get 'home' => 'home#index'
  namespace :v1 do 
    defaults format: :json do
      resources :users
      devise_for :users
      post 'auth' => 'auth#authenticate_user'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
