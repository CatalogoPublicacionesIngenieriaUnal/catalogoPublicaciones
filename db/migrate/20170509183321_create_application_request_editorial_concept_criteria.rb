class CreateApplicationRequestEditorialConceptCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :application_request_editorial_concept_criteria do |t|
      t.integer :score
      t.string  :remark
      t.references :application_requests, foreign_key: true
      t.references :editorial_concept_criteria, foreign_key: true
      t.timestamps
    end
  end
end
