class CreateEvaluators < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluators do |t|
      t.string :username,   null: false, uniqueness: true
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :email,      null: false, uniqueness: true
      
      t.timestamps
      t.belongs_to :language, foreign_key:true
      t.belongs_to :evaluation, foreign_key: true
    end
  end
end
