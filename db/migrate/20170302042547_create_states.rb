class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :name, :null => false, :uniqueness => true
      t.boolean :verifier, :null => false

      t.timestamps
    end
  end
end
