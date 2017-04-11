class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.belongs_to :publication, foreign_key: true

      t.timestamps
    end
  end
end
