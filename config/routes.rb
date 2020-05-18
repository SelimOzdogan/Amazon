Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get("images", to: "images")

  root "home#root"
  get("/home", to: "home#root")
  get("/contactus", to: "contactus#root")
  patch "/reviews/:id/toggle" => "reviews#toggle_hidden", as: "toggle_hidden"

  # get("/", to: "home#root")
  # get("/root", to: "home#root")
  # get("/home", to: "home#root")
  # get("/about", to: "about#root")
  # get("/contactUs", to: "contactus#root")
  # post("/post_contact", to: "contactus#post_contact")
  resources :favorites, only: [:index]

  #  get("/user/:id/edit",to: "user#edit")
  resource :session, only: [:new, :create, :destroy]
  resources :users

  resources :products do
    resources :reviews, shallow: true, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
    resources :favorites, only: [:create, :destroy]
  end
end
