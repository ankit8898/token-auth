Rails.application.routes.draw do


  # mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Student', at: 'auth'
  mount_devise_token_auth_for 'Professor', at: 'prof_auth'

  #  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  # as :professor do
  #   # Define routes for Admin within this block.
  # end

  # as :student do
  #   # Define routes for Admin within this block.
  # end
  resources :products,only: [:index]
  resources :courses,only: [:index]

end
