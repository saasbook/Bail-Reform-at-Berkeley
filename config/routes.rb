Rails.application.routes.draw do
  get 'donate/new' => 'donate#new', :as => 'new_donation'
  get 'donate/success' => 'donate#success', :as => 'successful_donation'
  get 'donate/error' => 'donate#fail', :as => 'failed_donation'
  get 'donate/:stripeToken/:amount' => 'donate#create', :as => 'create_donation'
  get 'home' => 'home#index',   :as => 'home'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
