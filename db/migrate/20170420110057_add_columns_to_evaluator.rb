class AddColumnsToEvaluator < ActiveRecord::Migration[5.0]
  def change
    change_table :evaluators do |t|
      t.string    :position
      t.string    :institution
      t.string    :degree
      t.string    :degree_institution
      t.string    :contact_number
      t.boolean   :first_update, default: false

    end

    add_index :evaluators, :email, unique: true
  end
end
