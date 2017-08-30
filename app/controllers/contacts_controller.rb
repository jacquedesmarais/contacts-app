class ContactsController < ApplicationController

def contact_action
  @title = "Contact"
  @contact = Contact.first
  render 'contact_page.html.erb'
end

def all_contacts_action
  @contacts = Contact.all
  render 'all_contacts_page.html.erb'
end

end
