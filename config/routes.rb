Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :users do
      devise_scope :user do
        resource :sessions, only: [:create, :destroy]
        resource :registrations, only: :create
      end
      resources :users, only: [], path: '' do
        resources :images, only: [:index, :create], on: :member
      end
    end
  end

  root to: 'pages#index'
end
