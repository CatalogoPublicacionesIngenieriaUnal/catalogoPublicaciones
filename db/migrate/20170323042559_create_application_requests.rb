class CreateApplicationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :application_requests do |t|
      t.string :url
      t.date :created_at
      t.date :updated_at

      t.timestamps
    end
  end
end
