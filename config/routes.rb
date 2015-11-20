Rails.application.routes.draw do
  devise_for :users
  resources :comics

  root 'comics#index'


  
end
