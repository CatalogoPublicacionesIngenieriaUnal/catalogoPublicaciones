class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.string :user
      t.string :name
      t.string :lastname
      t.string :email
      t.date :created_at

      t.timestamps
    end
  end
end
