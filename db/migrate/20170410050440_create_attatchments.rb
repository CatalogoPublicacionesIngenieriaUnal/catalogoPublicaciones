class CreateAttatchments < ActiveRecord::Migration[5.0]
  def change
    create_table :attatchments do |t|
      t.string :url, null: false
      t.integer :category, null: false
      t.belongs_to :application_request, foreign_key: true

      t.timestamps
    end
  end
end
