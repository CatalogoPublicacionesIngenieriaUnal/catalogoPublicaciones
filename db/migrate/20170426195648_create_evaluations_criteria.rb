class CreateEvaluationsCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations_criteria do |t|
      t.integer :score
      t.references :criteria, foreign_key: true
      t.references :evaluations, foreign_key: true
      t.timestamps
    end
  end
end
