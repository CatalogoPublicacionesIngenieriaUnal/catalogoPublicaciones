class ChangeAttatchment < ActiveRecord::Migration[5.0]
  def change
    rename_column :attatchments, :url, :pdf_document
  end
end
