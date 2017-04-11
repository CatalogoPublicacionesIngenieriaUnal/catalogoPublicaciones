class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category
      t.belongs_to :publication, foreign_key: true

      t.timestamps
    end
  end
end
