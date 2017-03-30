class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.text :concept, :null => false 
      t.text :justification, :null => false 
      t.date :assigned_at
      t.belongs_to :judge, :state, :application_request, foreign_key: true

      t.timestamps
    end
  end
end
