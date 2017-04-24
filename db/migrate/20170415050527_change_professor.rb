class ChangeProfessor < ActiveRecord::Migration[5.0]
  def change
    change_column :professors, :contact_number, :string
  end
end
