class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.string :username, :null => false
      t.string :first_name, :null =>false
      t.string :last_name, :null => false
      t.string :email, :null => false, :uniqueness => true

      t.timestamps
    end
  end
end
