Rails.application.routes.draw do
  
  resources :wikis

  devise_for :users
  
  resources :charges, only: [:new, :create]
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
  post 'charges/downgrade' => 'charges#downgrade', :as => 'downgrade'
  get 'charges/downgrade' => 'charges#downgrade', :as => 'downgrade_charge'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
