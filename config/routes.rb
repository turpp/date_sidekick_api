Rails.application.routes.draw do
  resources :date_activities
  resources :activities
  resources :outings
  resources :users



  get '/search/:zipcode/:type', to: 'activities#findActivity'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
