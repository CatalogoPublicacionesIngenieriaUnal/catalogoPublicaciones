class CreateApplicationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :application_requests do |t|
      t.integer :state, :null => false
      t.date :authorized_at

      t.belongs_to :professor, foreign_key:true
      t.timestamps
    end
  end
end
