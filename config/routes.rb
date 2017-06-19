Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: :show do
    resources :activities
  end
  root to: "home#index"

  resources :events, only: :create
  resources :invitations, param: :uuid, only: :show
end
