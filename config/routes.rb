Rails.application.routes.draw do
  get 'apis/image'
  resources :posts
  get 'home/show'
  get 'apis/image'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
