class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :department
      t.integer :contact_number
      t.integer :gender
      t.boolean :is_authorized

      t.timestamps
    end
  end
end
