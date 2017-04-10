class CreateAttatchments < ActiveRecord::Migration[5.0]
  def change
    create_table :attatchments do |t|
      t.string :url
      t.string :category

      t.timestamps
    end
  end
end
