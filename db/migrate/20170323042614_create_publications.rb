class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.text :abstract
      t.string :theme
      t.string :category

      t.timestamps
    end
  end
end
