Rails.application.routes.draw do
	namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show index update destroy]
    end
  end

  devise_for :users,
  defaults: { format: :json },
  path: '',
  path_names: {
    sign_in: 'api/user/login',
    sign_out: 'api/user/logout',
    registration: 'api/user/signup'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  post 'api/user/password/forgot', to: 'user_passwords#forgot'
  post 'api/user/password/reset', to: 'user_passwords#reset'


end