Rails.application.routes.draw do
  resources :students, only: %i[index show]
  resources :departments, only: %i[index show]
end
