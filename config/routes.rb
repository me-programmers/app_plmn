AppPlmn::Application.routes.draw do
  resources :pasiens


  resources :clients

  get "display/satu"
  get "main_page/homeforpasien"
  get "main_page/homeforpasien2"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end