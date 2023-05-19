Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :keywords do
    get "all", on: :collection
    get "sync_dictionary", on: :collection
  end

  resources :home do
    get "guide", on: :collection
  end

  root "home#index"
end
