class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|

      t.string :user, :null => false, :uniqueness => true
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.string :password
      t.string :email, :null => false, :uniqueness => true
      t.date :finish_at
      t.integer :telephone, :null => false
      t.belongs_to :language, foreign_key: true

      t.timestamps
    end
  end
end
