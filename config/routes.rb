Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users do
    resources :phone_books, only: [:index]
  end

  resources :text_messages

  resources :phone_numbers

  root 'text_messages#index'
end
