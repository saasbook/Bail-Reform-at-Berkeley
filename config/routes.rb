Rails.application.routes.draw do
  root 'info#index'

  # routes for donating
  get 'donate' => 'donate#index', :as => 'donation'
  get 'donate/new' => 'donate#new', :as => 'new_donation'
  get 'donate/success' => 'donate#success', :as => 'successful_donation'
  get 'donate/error' => 'donate#fail', :as => 'failed_donation'
  get 'donate/:stripeToken/:amount' => 'donate#create', :as => 'create_donation'

  # routes for applicants
  get 'apply' => 'apply#index', :as => 'application'
  get 'apply_form_submit' => 'apply#apply_bail'
  get 'apply/new' => 'apply#new', :as => 'new_application'

  # routes for logistics
  get 'home' => 'info#index',   :as => 'home'
  get 'about' => 'info#about', :as => 'about'
  get 'team' => 'info#team', :as => 'team'
  get 'participate' => 'info#participate', :as => 'participate'
  get 'faq' => 'info#faq', :as => 'faq'
  get 'blog' => 'info#blog', :as => 'blog'
  get 'contact' => 'info#contact', :as => 'contact'

  # routes for login
  # post 'sign_in' => 'login#sign_in', :as => 'sign_in_submit'
  get 'sign_in' => 'login#sign_in', :as => 'sign_in_submit' #delete this when we have a form
  get 'sign_in_form' => 'login#sign_in_form', :as => 'sign_in'
  get 'sign_out' => 'login#sign_out', :as => 'sign_out'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
