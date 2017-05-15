class CreateEdConAppRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :ed_con_app_requests do |t|
      t.integer :score
      t.string  :remark
      t.references :application_request, foreign_key: true
      t.references :editorial_concept_criterium, foreign_key: true
      t.timestamps
    end
  end
end
