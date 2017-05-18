class CreateEditorialConceptCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :editorial_concept_criteria do |t|
      t.string :criterium

      t.timestamps
    end
  end
end
