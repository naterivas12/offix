Rails.application.routes.draw do
  resources :employees
  devise_for :employees
  root "departments#index"
  resources :departments
  resources :departments do
    resources :employees, only: %i[new create update]
  end
end
