Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#root"
  get("/home", to: "home#root")
  get("/contactus", to: "contactus#root")

  # get("/", to: "home#root")
  # get("/root", to: "home#root")
  # get("/home", to: "home#root")
  # get("/about", to: "about#root")
  # get("/contactUs", to: "contactus#root")
  # post("/post_contact", to: "contactus#post_contact")

  # get("/product/new",to: "product#new")

  resources :products do
    resources :reviews, only: [:create, :destroy]
  end
end
