class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
