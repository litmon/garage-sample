Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"

  scope :api do
    use_doorkeeper

    scope :v1 do
      resources :users, only: %i(index show create)
    end
  end
end
