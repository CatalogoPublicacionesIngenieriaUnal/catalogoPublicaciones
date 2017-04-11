class CreateProfessorApplicationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :professor_application_requests do |t|
      t.belongs_to :professor, foreign_key: true
      t.references :application_request, foreign_key: true
      t.boolean :is_holder

      t.timestamps
    end
  end
end
