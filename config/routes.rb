Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants,only: [:index,:show,:create]  #creates the endpoints for retrieving all plants and a specific one.Remember it is a method and can be invoked using brackets.
  #This will only create three necessary routes.
end
