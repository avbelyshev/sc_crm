Rails.application.routes.draw do
  devise_for :clients, skip: %i[registrations]
  devise_for :staffs, skip: %i[registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :staffs do
    root 'application#index'
    get '/user', to: 'application#user', as: :user
    get '/organizations/legal_forms', as: :legal_forms

    resources :staffs, only: %i[index create edit update destroy], shallow: true
    resources :clients, only: %i[index create edit update destroy], shallow: true
    resources :organizations, only: %i[index create edit update destroy], shallow: true

    get '*slug', to: 'application#index'
  end

  namespace :clients do
    root 'application#index'
    get '/user', to: 'application#user', as: :user

    get '*slug', to: 'application#index'
  end

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Staff', at: 'staff_auth', skip: %i[registrations]
      mount_devise_token_auth_for 'Client', at: 'client_auth', skip: %i[registrations]
    end
  end

  get '*slug', to: 'home#index'
end
