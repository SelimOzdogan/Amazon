Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get("/", to: "home#root")
get("/about", to: "about#root")
get("/contactus", to: "contactus#root")
get("/contactUs", to: "contactus#root")
post("/post_contact", to: "contactus#post_contact")

end
