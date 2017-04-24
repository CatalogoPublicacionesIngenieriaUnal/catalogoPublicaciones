class AddToProfessors < ActiveRecord::Migration[5.0]
  def change
      add_index :professors, :username, unique: true
  end
end
