AppPlmn::Application.routes.draw do

  resources :hasil3s


  resources :pasien3s


  resources :lab2s


  resources :hasil2s do
    member do
      get "addnew"
    end
  end


  resources :pasien2s do
    member do
      get "shownota"
    end
  end
  
  resources :widgets, only: [:index]
  
  resources :pasiens do
    #member do
    #  get 'print'
    #end
    resources :hasils
  end

  resources :clients

  get "display/satu"
  get "display/import2"
  get "display/import3"
  get "main_page/homeforpasien"
  get "main_page/homeforpasien2"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end