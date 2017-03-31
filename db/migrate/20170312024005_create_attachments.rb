class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :url, :null => false
      t.string :category, :null => false 
      t.belongs_to :application_request, foreign_key: true

      t.timestamps
    end
  end
end
