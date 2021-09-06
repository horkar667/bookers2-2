Rails.application.routes.draw do
  get '/home/about' => "homes#about"
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:create,:destroy,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
