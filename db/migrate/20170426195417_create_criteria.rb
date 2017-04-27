class CreateCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :criteria do |t|
      t.string :criterion
      t.integer :criterion_type

      t.timestamps
    end
  end
end
