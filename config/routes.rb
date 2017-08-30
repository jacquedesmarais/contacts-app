Rails.application.routes.draw do
  get '/contact_url' => 'contacts#contact_action'
  get 'all_contacts_url' => 'contacts#all_contacts_action'
end
