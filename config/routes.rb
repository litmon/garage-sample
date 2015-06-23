Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"

  scope :api do
    use_doorkeeper
  end

  namespace :api do
    resources :users, only: %i(show update)
  end
end
