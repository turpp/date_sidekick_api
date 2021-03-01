Rails.application.routes.draw do
  resources :date_activities
  resources :activities
  resources :outings
  resources :users
  resources :sessions, only: [:create]


  get '/search/:zipcode/food', to: 'activities#findActivity'
  get '/search/:zipcode/food-activity', to: 'activities#findFoodActivity'
  get '/logged_in', to: 'sessions#logged_in'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
