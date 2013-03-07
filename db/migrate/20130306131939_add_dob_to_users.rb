class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :religion, :string
    add_column :users, :about_you, :text
  end
end
