class CreateProfessorPublications < ActiveRecord::Migration[5.0]
  def change
    create_table :professor_publications do |t|
    	t.belongs_to :professor, :publication, foreign_key: true

      t.timestamps
    end
  end
end
