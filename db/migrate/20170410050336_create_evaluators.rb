class CreateEvaluators < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluators do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
