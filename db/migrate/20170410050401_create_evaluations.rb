class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.text :justification
      t.integer :state

      t.timestamps
    end
  end
end
