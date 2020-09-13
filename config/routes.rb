Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/edit'
  get 'home/show'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
