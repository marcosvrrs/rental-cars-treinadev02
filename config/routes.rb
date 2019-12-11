Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to:  'home#index'
resources :manufacturers
resources :subsidiaries
resources :car_categories
resources :clients
resources :car_models
resources :cars
resources :rentals do 
  get 'search', on: :collection
  # get 'review' , poderia ser um form para revisar a locação
  post 'start', on: :member  
  # post pois é do botão para iniciar a locação
end   


end
