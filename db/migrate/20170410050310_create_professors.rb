class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :username, :null => false, :uniqueness => true
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false, :uniqueness => true
      t.integer :department
      t.integer :contact_number
      t.integer :gender, :null => false
      t.boolean :is_authorized

      t.timestamps
    end
  end
end
