class AddColumnsToEvaluation < ActiveRecord::Migration[5.0]
  def change
    change_table :evaluations do |t|
      t.string  :publication_clasiffication
      t.string  :publication_translated_material
      t.text    :publication_synopsis
      # t.integer :
      t.text    :general_score_justification
      # t.integer segunda tabla de calificacion
      t.text    :writing_score_jistification
      t.text    :aditional_remarks_to_author
      t.text    :aditional_remarks_to_publisher
      t.integer :disclosure_degree
      t.integer :target_audience
      t.text    :target_audience_remark
      # t.text   :extra_target_audience
    end
  end
end
