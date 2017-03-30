class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.text :abstract
      t.string :theme
      t.string :category
      t.belongs_to :application_request, foreign_key: true

      t.timestamps
    end
  end
end
