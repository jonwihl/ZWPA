class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :contact_phone
      t.string :contact_email
      t.string :contact_title
      t.string :contact_first_name
      t.string :contact_last_name
      t.boolean :active

      t.timestamps
    end
  end
end
