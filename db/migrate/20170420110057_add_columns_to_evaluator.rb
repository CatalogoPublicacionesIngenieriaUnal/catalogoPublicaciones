class AddColumnsToEvaluator < ActiveRecord::Migration[5.0]
  def change
    change_table :evaluators do |t|
      t.string    :url_token, null: false
      t.string    :position
      t.string    :institution
      t.string    :degree
      t.string    :degree_institution
      t.string    :contact_number

      t.integer   :sign_in_count,   default: 0, null: false
      t.integer   :failed_attempts, default: 0, null: false

      t.datetime  :last_sign_in_at
      t.datetime  :code_asigned_at

      t.boolean   :is_locked, default: false, null: false
    end

    add_index :evaluators, :email, unique: true
    add_index :evaluators, :url_token, unique: true
  end
end
