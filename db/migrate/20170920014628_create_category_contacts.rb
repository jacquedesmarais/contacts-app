class CreateCategoryContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :category_contacts do |t|
      t.integer :contact_id
      t.integer :category_id

      t.timestamps
    end
  end
end
