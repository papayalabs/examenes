Rails.application.routes.draw do
  resources :exams
  resources :answers
  resources :questions
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
