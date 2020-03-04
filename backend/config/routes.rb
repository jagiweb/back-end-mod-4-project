Rails.application.routes.draw do
  # resources :pictures
  # resources :users
  post "/sign-in", to: "users#sign_in"
  post "/sign-up", to: "users#sign_up"
  # post "/sign-up", to: "users#create"
  get "/validate", to: "users#validate"
  # get "/users/", to: "users#my_profile"
  patch "/update-profile/:id", to: "users#update_profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
