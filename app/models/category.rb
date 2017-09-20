class Category < ApplicationRecord
  has_many :category_contacts
  has_many :contacts, through: :category_contacts
end
