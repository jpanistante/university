Rails.application.routes.draw do
  resources :pages, except: [:show]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  get "search", to: "students#search"
  resources :students, only: %i[index show]
  resources :departments, only: %i[index show]
  root to: "home#index"
end
