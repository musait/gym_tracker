Rails.application.routes.draw do

  devise_for :users
  resources :themes
  resources :exercises
  resources :workout_sessions
  resources :workouts


  root to: "workout_sessions#index"
end
