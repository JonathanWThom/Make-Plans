Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: :show do
    post "set_user_location", on: :member
    resources :activities, only: [:new, :create, :destroy]
  end

  resources :activities, only: [:index, :show]

  root to: "home#index"

  resources :events, only: [:new, :create]

  resources :invitations, param: :uuid, only: [:show] do
    post "rsvp", on: :member
    patch "decline", on: :member
  end
end
