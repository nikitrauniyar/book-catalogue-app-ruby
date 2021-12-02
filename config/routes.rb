Rails.application.routes.draw do
  resources :books do
    resources :categories
  end

  resources :categories
  resources :admins
  root "books#list"
  get 'books/new'
  get 'categories/new'
  get 'admins/show'
  post "/auth", to: 'admins#auth'
  post "/search",to: 'books#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
