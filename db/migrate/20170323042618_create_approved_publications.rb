class CreateApprovedPublications < ActiveRecord::Migration[5.0]
  def change
    create_table :approved_publications do |t|
      t.string :resolution
      t.integer :stock
      t.integer :stock_at_store
      t.integer :stock_at_library

      t.timestamps
    end
  end
end
