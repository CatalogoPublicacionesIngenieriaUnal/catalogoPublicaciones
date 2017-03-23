class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :user
      t.string :name
      t.string :lastname
      t.string :departament
      t.string :email
      t.date :created_at

      t.timestamps
    end
  end
end
