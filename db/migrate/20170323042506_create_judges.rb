class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.string :user
      t.string :name
      t.string :lastname
      t.string :password
      t.string :email
      t.date :created_at
      t.date :finish_at
      t.integer :telephone

      t.timestamps
    end
  end
end
