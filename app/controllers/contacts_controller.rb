class ContactsController < ApplicationController

def contact_action
  @title = "Contact"
  @contact = Contact.first
  render 'contact_page.html.erb'
end

end
