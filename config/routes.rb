Rails.application.routes.draw do
  root 'movies#home'
  post '/search', to: 'movies#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
