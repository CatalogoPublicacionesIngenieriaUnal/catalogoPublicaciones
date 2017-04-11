class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.text :title
      t.text :abstract
      t.integer :category
      t.belongs_to :application_request, foreign_key: true
      
      t.timestamps
    end
  end
end
