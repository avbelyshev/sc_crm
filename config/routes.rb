Rails.application.routes.draw do
  devise_for :clients, skip: %i[registrations]
  devise_for :staffs, skip: %i[registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :staffs do
    root 'application#index'
  end

  namespace :clients do
    root 'application#index'
  end

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Staff', at: 'staff_auth', skip: %i[registrations]
      mount_devise_token_auth_for 'Client', at: 'client_auth', skip: %i[registrations]
    end
  end
end
