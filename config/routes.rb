Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ## devise controllers for users
  devise_for :user, controllers: {
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, skip: [:sessions]

  ## custom routes for users
  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    get 'logout' => 'users/sessions#destroy',to: redirect('/login'), as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end
end
