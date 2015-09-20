class ContactsController < ApplicationController
  def new
    # Store empty Contact object to help generate Form
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    # When we save the contacts
    if @contact.save
      # Assign variables using Hash syntax for Query String Parameters
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Call method from mailer file
      ContactMailer.contact_email(name, email, body).deliver
      
      # Show Flash notice
      flash[:success] = 'Message sent.'
      # Redirect to the same new contact url
      redirect_to new_contact_path
    else
      flash[:danger] = 'Error occured, message has not been sent.'
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      # White list the parameters
      params.require(:contact).permit(:name, :email, :comments)
    end
  
end