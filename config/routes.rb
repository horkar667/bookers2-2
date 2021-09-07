Rails.application.routes.draw do
  get 'favoretes/create'
  get 'favoretes/destroy'
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => "homes#about"
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:create,:destroy,:edit,:update] do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
