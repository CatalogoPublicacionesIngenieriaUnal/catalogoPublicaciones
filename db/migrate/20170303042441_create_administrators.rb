class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.string :user, :null => false 
      t.string :name, :null => false 
      t.string :lastname, :null => false 
      t.string :email, :null => false, :uniqueness => true
      t.date :created_at, :null => false 

      t.timestamps
    end
  end
end
