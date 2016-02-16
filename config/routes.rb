Rails.application.routes.draw do

  devise_for :users
  resources :tasks
  get "/about" => "pages#about"
  root "pages#home"

end
