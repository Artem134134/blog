class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
      @contact = Contact.new(contact_params)
    if @contact.valid?
       @contact.save
       flash[:success] = "Your form has been submitted!"
       redirect_to root_path
    else
      flash.now[:warning] = "Failed to create contact. Please check the errors."
      render :new
    end
  end


  private 

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end

  

