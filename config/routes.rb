Rails.application.routes.draw do
  resources :users do
    resources :questions
    resources :answers
  end

  resources :questions do
    resources :answers
  end
end
