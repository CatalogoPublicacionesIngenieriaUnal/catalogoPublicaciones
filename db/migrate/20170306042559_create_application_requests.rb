class CreateApplicationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :application_requests do |t|

      t.string :url, :null => false
      t.date :created_at
      t.date :updated_at 

      t.date :created_at
      t.date :updated_at

      t.belongs_to :state, foreign_key: true

      t.timestamps
    end
  end
end
