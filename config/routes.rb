Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'bases/user_profile', to: 'bases#user_profile'#プロフィール用
  get 'bases/user_register', to: 'bases#user_register'#ルーム登録用
  get 'bases/user_register_show', to: 'bases#user_register_show'#ルーム登録情報開示用
  get 'bases/reservation_show', to: 'bases#reservation_show'
  resources :bases

  resources :items do
    collection do
      get 'search'#商品検索用
    end
    resources :reservations
    post 'reservations/reservation_params_cfm', to: 'reservations#reservation_params_cfm'
    post 'reservations/reservation_params_back', to: 'reservations#reservation_params_back'
    get 'reservations/reservation_params_complete', to: 'reservations#reservation_params_complete'
  end

end
