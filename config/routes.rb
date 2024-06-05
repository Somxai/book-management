Rails.application.routes.draw do

  root 'home#index'
  get 'authors/authors'
  get 'books/books'
  get 'home/index'
  get 'home/about'

  #resources
  resources :books
  resources :authors



  get "up" => "rails/health#show", as: :rails_health_check

end
