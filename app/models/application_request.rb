class ApplicationRequest < ApplicationRecord
  has_many :attachments
  has_many :proffessor_application_requests
  has_many :professors, through: :proffessor_application_requests
  has_many :evaluations
  has_one :publication
  belongs_to :state

   def self.load_applications_by_state_id(id,page = 1, per_page = 10)
      includes(:state).where("state_id = ?", id)
  end



  def self.load_applications_by_professor_id(id,page = 1, per_page = 10)
      includes(:professor_application_requests,:professors).where("id = ?",id)
  end

  def self.find_by_evaluation_status(id)
    includes(:evaluations).where('state_id = ?', id)
  end


end
