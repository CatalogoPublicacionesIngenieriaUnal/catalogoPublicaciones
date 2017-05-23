class CreateEvaluationAttatchments < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluation_attatchments do |t|
      t.string :pdf_document
      t.string :evaluator
      t.timestamps
      t.belongs_to :evaluation, foreign_key: true
    end
  end
end
