class CreateEvaluationsCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations_criteria do |t|
      t.integer :score
      t.references :criterium, foreign_key: true
      t.references :evaluation, foreign_key: true
      t.timestamps
    end
  end
end
