class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.integer :mobile_number
      t.string :alternative_email

      t.timestamps
    end
  end
end
