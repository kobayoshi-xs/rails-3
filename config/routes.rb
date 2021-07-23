Rails.application.routes.draw do
  #get 'bases/index', to: 'bases#index'
  #get 'users/registrations', to: 'users#new'
  #resources :users, only: [:show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'bases/user_profile', to: 'bases#user_profile'#プロフィール用
  resources :bases

end
