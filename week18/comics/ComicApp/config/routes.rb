Rails.application.routes.draw do
  devise_for :users

  get '/users/:id' => 'users#show'

  root to: "static_pages#home"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
