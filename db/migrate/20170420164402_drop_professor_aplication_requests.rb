class DropProfessorAplicationRequests < ActiveRecord::Migration[5.0]
  def change
    drop_table :professor_application_requests  
  end
end
