FuzzyComputingMachine::Application.routes.draw do

  resources :queries

  root 'home#index'
end
