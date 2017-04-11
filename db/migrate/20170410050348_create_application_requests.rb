class CreateApplicationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :application_requests do |t|
      t.integer :state, :null => false
      t.date :authorized_at

      t.timestamps
    end
  end
end
