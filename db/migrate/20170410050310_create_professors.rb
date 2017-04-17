class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :username, :null => false, :uniqueness => true
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false, :uniqueness => true
      t.integer :department, :default => 1
      t.integer :contact_number
      t.integer :gender, :default => 1
      t.boolean :is_authorized, :default => false

      t.timestamps
    end
  end
end
