Rails.application.routes.draw do
  devise_for :clients, skip: %i[registrations]
  devise_for :staffs, skip: %i[registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :staffs do
    root 'application#index'
    get '/user', to: 'application#user', as: :user
    resources :clients, only: %i[index create], shallow: true
    resources :organizations, only: %i[index create destroy], shallow: true
    get '/organizations/legal_forms', as: :legal_forms
  end

  namespace :clients do
    root 'application#index'
    get '/user', to: 'application#user', as: :user
  end

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Staff', at: 'staff_auth', skip: %i[registrations]
      mount_devise_token_auth_for 'Client', at: 'client_auth', skip: %i[registrations]
    end
  end
end
