class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
<<<<<<< HEAD:db/migrate/20170307042519_create_evaluations.rb
      t.text :concept, :null => false 
      t.text :justification, :null => false 
=======
      t.text :justification 
>>>>>>> feature/Queries:db/migrate/20170307042519_create_evaluations.rb
      t.date :assigned_at
      t.belongs_to :judge, :state, :application_request, foreign_key: true

      t.timestamps
    end
  end
end
