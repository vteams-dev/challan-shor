# == Route Map
#
#         Prefix Verb URI Pattern               Controller#Action
#          users POST /users(.:format)          users#create
#   users_verify POST /users/verify(.:format)   users#verify
# user_locations POST /user_locations(.:format) user_locations#create
#   mark_dangers POST /mark_dangers(.:format)   mark_dangers#create
#

Rails.application.routes.draw do
  # apipie
  resources :users, only: [:create]
  post 'users/verify' => "users#verify"
  post 'users/update' => "users#update_user", as: :update_user
  # post 'users/add_device_token' => "users#add_device_token", as: :add_token
  # post 'users/update_device_token' => "users#update_device_token", as: :update_token
  resources :user_locations, only: [:create]
  resources :mark_dangers, only: [:create]
end
