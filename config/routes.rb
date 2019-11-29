Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users,only:[:show,:edit,:index,:update]
  resources :books
end
