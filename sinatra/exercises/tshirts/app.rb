# app.rb

require "sinatra"
require "sinatra/reloader" if development?
require "pry"

enable(:sessions)

# 1. list of shirts
# 2. single shirt page
# 3. post to add shirt to shopping cart
# 4. checkout page

# /tshirts/1  -> Deep V
# /tshirts/2  -> Ed Hardy
# /tshirts/3  -> Cat T-Shirt
#                    1                2                    3
inventory = [ "Deep V T-Shirt", "Ed Hardy T-Shirt", "Cat T-Shirt" ]

credentilas = {
  "khalifenizar" => "swordfish",
  "jalexy12" => "password",
  "karinfpe" => "ironhack",
  "javi" => "garcia"
}

get "/" do
  if session[:username].nil?
    erb(:login)
  else
    @username = session[:username]

    if session[:cart].nil?
      session[:cart] = []
    end

    @shirts = inventory
    @number_of_items = session[:cart].length

    erb(:tshirts)
  end  
end

post "/login" do
  username = params[:username]
  password = params[:password]
  
  if credentilas[username].nil?
    erb(:wrong_login)
  elsif credentilas[username] != password
    erb(:wrong_login)
  else
    session[:username] = username

    redirect to("/")
  end
end

get "/logout" do
  session[:username] = nil

  redirect to("/")
end

get "/tshirts/:tshirt_id" do
  @tshirt_id = params[:tshirt_id].to_i
  @tshirt_type = inventory[@tshirt_id - 1]

  erb(:tshirt_page)
end

post "/add_to_cart" do
  tshirt_id = params[:tshirt_id]

  # Only set cart to empty array if it's nil
  # Otherwise it will overwrite stuff I previously had in cart
  if session[:cart].nil?
    session[:cart] = []
  end

  session[:cart].push(tshirt_id)

  redirect to("/")
end

get "/checkout" do
  if session[:cart].nil?
    session[:cart] = []
  end

  id_array = session[:cart]
  @checkout_array = []

  id_array.each do |id|
    tshirt = inventory[id.to_i - 1]
    @checkout_array.push(tshirt)
  end
  
  session[:cart] = []
  
  erb(:checkout)
end