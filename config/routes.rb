Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user do
    # root to: 'dashboard#index', as: :authenticated_root
  end

  root to: 'home#index'
end
