class CreateProfessorPublications < ActiveRecord::Migration[5.0]
  def change
    create_table :professor_publications do |t|

      t.timestamps
    end
  end
end
