class ContactsController < ApplicationController
	
	def new
        @title = "Contact"
    	# id is required to deal with form
    	@contact = Contact.new(:id => 1)
  	end

        def create
   	@contact = Contact.new(params[:contact])
    	if @contact.save
      	  redirect_to('/', :notice => "Contact request was successfully sent. Dude")
    	else
      	  flash[:notice] = "You must fill all fields."
      	  render 'new'
    end
  end
end
