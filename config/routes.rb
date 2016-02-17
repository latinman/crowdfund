Rails.application.routes.draw do

  devise_for :users
  resources :tasks do
    member do
      put :change
    end
  end
  get "/test" => "pages#test"
  get "/about" => "pages#about"
  root "pages#home"

end
