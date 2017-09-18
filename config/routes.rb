Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: :show do
    post "set_user_location", on: :member
    resources :activities, only: [:new, :create]
  end

  resources :activities, only: [:index]

  root to: "home#index"

  resources :events, only: [:new, :create]

  resources :invitations, param: :uuid, only: [:show] do
    post "rsvp", on: :member
    patch "decline", on: :member
  end
end
