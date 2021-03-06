# == Route Map
#
#         Prefix Verb URI Pattern               Controller#Action
#          users POST /users(.:format)          users#create
#   users_verify POST /users/verify(.:format)   users#verify
# user_locations POST /user_locations(.:format) user_locations#create
#   mark_dangers POST /mark_dangers(.:format)   mark_dangers#create
#

Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post 'users/verify' => "users#verify"
      post 'users/update' => "users#update_user", as: :update_user
      resources :user_locations, only: [:create]
      resources :mark_dangers, only: [:create]
    end
  end
end
