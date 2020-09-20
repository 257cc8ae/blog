Rails.application.routes.draw do
  get 'searches', to: "searches#index"
  get 'apis/image'
  resources :posts
  resources :tags
  resources :pictures
  get 'home/show'
  get 'apis/image'
  get 'apis/name_check'
  get 'apis/active_storage'
  root to: "home#index"
  get "about", to: "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
