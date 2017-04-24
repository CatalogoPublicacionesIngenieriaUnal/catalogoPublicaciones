class CreateKeywordPublications < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_publications do |t|
      t.references :keyword, foreign_key: true
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
