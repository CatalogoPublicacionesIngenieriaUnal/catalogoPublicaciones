class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.text :justification
      t.integer :state, null: false
      t.belongs_to :application_request, foreign_key: true

      t.timestamps
    end
  end
end
