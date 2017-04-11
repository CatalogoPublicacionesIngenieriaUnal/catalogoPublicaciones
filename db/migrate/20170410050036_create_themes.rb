class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :theme
      t.belongs_to :publication, foreign_key: true
      
      t.timestamps
    end
  end
end
