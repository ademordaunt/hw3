Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # get("/", { :controller => "articles", :action => "index" })

  # Set the landing page using the hint format:
  get("/", { :controller => "places", :action => "index" })

  # Define routes for places (index, show, new, create)
  resources :places, only: [:index, :show, :new, :create] do
    # Nested routes for entries (new and create)
    resources :entries, only: [:new, :create]
  end
end
