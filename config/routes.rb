Rails.application.routes.draw do

  get 'home' => 'home#index'
  namespace :v1 do 
    defaults format: :json do
      devise_for :users
      resources :users
      post 'auth' => 'auth#authenticate_user'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
