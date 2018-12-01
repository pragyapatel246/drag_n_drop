Rails.application.routes.draw do
  resources :pets
  resources :movies
  resources :photos
  root 'movies#index'
end
