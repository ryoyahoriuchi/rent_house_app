Rails.application.routes.draw do
  root 'renthouses#index'
  resources :renthouses
end
