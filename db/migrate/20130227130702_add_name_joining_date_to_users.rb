class AddNameJoiningDateToUsers < ActiveRecord::Migration
  
  def change
    
    add_column :users, :first_name,   :string
    add_column :users, :middle_name,  :string, :default => ""
    add_column :users, :last_name,    :string
    add_column :users, :joining_date, :date
    add_column :users, :emp_id,       :string
    
    
    add_index :users, :emp_id, :unique => true
    
  end
  
end
