class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :username, :null => false, :uniqueness => true
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.string :departament, :null => false
      t.string :email, :null => false, :uniqueness => true

      t.timestamps
    end
      add_index :professors, :username
  end
end
