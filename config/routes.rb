Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' },
    path_name: { sign_in: 'login', sign_out: 'logout' }

  root 'home#index'
end
