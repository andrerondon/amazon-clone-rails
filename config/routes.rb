Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", to: "welcome#root") 

  get("/contact_us", to: "welcome#contact_us") 

  post("/process_contact", to: "welcome#process_contact")

  # get("/products", to: "products#index")

  # get("/product/new", to: "products#new") 

  # get("/product/:id/edit", to: "products#edit")

  # post("/products", to: "products#create") 

  # get("/product/:id", to: "products#show", as: :product)

  # get("/products", to: "products#index")

  # get("/products/new", to: "products#new", as: :new_product)
  # post("/products", to: "products#create" )

  # get("/products/:id", to: 'products#show', as: :product)
  # delete("products/:id", to: 'products#destroy')
  # get("products/:id/edit", to: 'products#edit', as: :edit_product)
  # patch("/products/:id", to: "products#update")

  resource :session, only: [:new, :create, :destroy]

  resources :products do
    resources :reviews, only: [:create, :destroy]
  end
end


# Build a home and about pages
# Build 'home' and 'about' pages for your Amazon application that just display simple text. Build 'nav bar' to link to both pages. Include a link to the 'contact us' page in the 'nav bar'.