Rails.application.routes.draw do
  	devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations" }
  
  	root 'barbecues#index'

  	resources :barbecues, only: [ :index, :show, :new, :create ]

	scope "/api" do
	  	# resources(:barbecues, only: [:show])

	  	get("/barbecues/:id", :to => "barbecues#api_show")
	  	post("/barbecues/:id/join", :to => "barbecues#api_join")
	  	post("/barbecues/:id/items", :to => "barbecues#api_add_item", :as => :items)
	end  
end
