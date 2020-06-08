Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :meals do
    resources :reviews, only: %i(index new create)
  end
  resources :reviews, only: %i[destroy]
end
