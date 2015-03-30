Rails.application.routes.draw do

  mount_devise_token_auth_for 'Author',    at: 'auth'
  mount_devise_token_auth_for 'Professor', at: 'prof_auth'

  resources :products,  only: [:index]
  resources :courses,   only: [:index]
  resources :posts,     only: [:index,:create,:show]
  resources :comments,  only: [:create]
  resources :likes,     only: [:create]

end
