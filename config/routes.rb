Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :keywords do
    get "all", on: :collection
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root "keywords#index"
end
