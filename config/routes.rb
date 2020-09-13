Rails.application.routes.draw do
  get 'apis/image'
  resources :posts
  get 'home/show'
  get 'apis/image'
  get 'apis/name_check'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
