class RemoveCategoryFromPublications < ActiveRecord::Migration[5.0]
  def change
    remove_column  :publications, :category
  end
end
