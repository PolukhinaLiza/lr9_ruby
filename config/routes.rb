Rails.application.routes.draw do
  root 'index#input'
  get '/calc', :to => 'index#calc'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end