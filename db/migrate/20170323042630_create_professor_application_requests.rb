class CreateProfessorApplicationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :professor_application_requests do |t|

      t.timestamps
    end
  end
end
