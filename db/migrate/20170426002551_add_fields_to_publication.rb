class AddFieldsToPublication < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :publishing_unit, :integer
  end
end
