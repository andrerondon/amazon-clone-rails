Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resource :welcome
  get("/", to: "welcome#root") 

  get("/contact_us", to: "welcome#contact_us") 

  post("/process_contact", to: "welcome#process_contact")

  resource :session, only: [:new, :create, :destroy]

  resources :products do
      resources :reviews, only: [:create, :destroy]
    end
  end


# Build a home and about pages
# Build 'home' and 'about' pages for your Amazon application that just display simple text. Build 'nav bar' to link to both pages. Include a link to the 'contact us' page in the 'nav bar'.