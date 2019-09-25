Rails.application.routes.draw do
  devise_for :clients
  devise_for :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :staffs do
    mount_devise_token_auth_for 'Staff', at: 'staff_auth'
    root 'application#index'
  end

  namespace :clients do
    mount_devise_token_auth_for 'Client', at: 'client_auth'
    root 'application#index'
  end
end
