class AddFieldsToProfessor < ActiveRecord::Migration[5.0]
  def change
    change_table :professors do |t|
      t.integer :dependency
      t.string  :position
      t.string  :identity_document
      t.integer :identity_document_type
      t.string  :identity_document_issued
    end
  end
end
