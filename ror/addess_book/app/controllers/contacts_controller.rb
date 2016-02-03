class ContactsController < ApplicationController
	def index
		@contacts = Contact.alphabetical_order
	end

	def new
		render("new")
	end

	def create
		# Create new Contact from params[:contact]
    	contact = Contact.new(
      		:name => params[:contact][:name],
      		:address => params[:contact][:address],
      		:phone => params[:contact][:phone],
      		:email => params[:contact][:email])

		# Now we save the contact
    	contact.save

		redirect_to("/contacts")
  	end

	def info
		contact_id = params[:contact_id]

		@contact = Contact.find(contact_id)

		render("info")
	end

	def add_favorite
		contact_id = params[:contact_id]

		contact = Contact.find(contact_id)

		contact.update_attributes(favorite: true)

		redirect_to("/contacts")
	end

	def delete_favorite
		contact_id = params[:contact_id]

		contact = Contact.find(contact_id)

		contact.update_attributes(favorite: false)

		redirect_to("/contacts")
	end	
end
