Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations]
  resources :images, only: [:index, :create]

  authenticated :user do
    root to: 'images#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
