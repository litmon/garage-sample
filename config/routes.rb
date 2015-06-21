Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  root to: "home#index"

  scope :v1 do
    resources :users, only: %i(index show create)
  end
end
