Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/gyms", to: "gyms#index"
  get "/gyms/:id", to: "gyms#show"
  get "/members", to: "members#index"
  get "/members/:id", to: "members#show"
end
