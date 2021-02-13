Rails.application.routes.draw do
  resource :signup, only: %i[create]
  resources :authentications, only: %i[create]
  resources :users, only: %i[index]
  put 'archive/:user_id', to: 'users#archive_user'
end
