class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.text :concept
      t.text :justification
      t.date :assigned_at

      t.timestamps
    end
  end
end
