Rails.application.routes.draw do
  resources :projects
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :articles
  devise_for :users

  root to: "projects#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
