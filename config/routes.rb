Rails.application.routes.draw do
  devise_for :clients
  devise_for :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :staffs do
    root 'application#index'
  end

  namespace :clients do
    root 'application#index'
  end
end
