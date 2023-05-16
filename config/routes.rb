Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/gyms", to: "gyms#index"
  get "/gyms/new", to: "gyms#new"
  post "/gyms", to: "gyms#create"
  get "/gyms/:id", to: "gyms#show"
  get "/gyms/:id/edit", to: "gyms#edit"
  patch "/gyms/:id", to: "gyms#update"
  get "/gyms/:id/members", to: "gyms/members#index"
  get "/members", to: "members#index"
  get "/members/:id", to: "members#show"
end
