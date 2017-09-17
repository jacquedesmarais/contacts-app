class ContactsController < ApplicationController

def index
  if current_user
    @contacts = current_user.contacts
  else
    @contacts = Contact.all
    end
  search_term = params[:search_term]
  if search_term
    @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
  end
end

def show
  @contact = Contact.find_by(id: params[:id])
end

def new
  
end

def create
  contact = Contact.new(
                        first_name: params[:first_name], 
                        last_name: params[:last_name], 
                        middle_name: params[:middle_name],
                        email: params[:email], 
                        phone_number: params[:phone_number],
                        bio: params[:bio],
                        user_id: current_user.id
                        )
  contact.save
  flash[:success] = "Contact created."
  redirect_to "/contacts/#{contact.id}"
end

def edit
  @contact = Contact.find_by(id: params[:id])
end

def update
  contact = Contact.find_by(id: params[:id])
  contact.assign_attributes(
                            first_name: params[:first_name], 
                            last_name: params[:last_name], 
                            middle_name: params[:middle_name],
                            email: params[:email], 
                            phone_number: params[:phone_number],
                            bio: params[:bio],
                            user_id: current_user.id
                            )
  contact.save
  flash[:success] = "Contact updated."
  redirect_to "/contacts/#{contact.id}"
end

def destroy
  @contact = Contact.find_by(id: params[:id])
  @contact.destroy
  flash[:warning] = "Contact deleted."
  redirect_to "/"
end

end
