class ApplicationRequest < ApplicationRecord
  has_many :attachments
  has_many :proffessor_application_requests
  has_many :professors, through: :proffessor_application_requests
  has_many :evaluations
  belongs_to :state

  def self.load_applications_by_id(id,page = 1, per_page = 10)
      joins(:publication,:evaluation).where("id = ?", id)
        .paginate(:page => page,:per_page => per_page)
  end

  def self.load_applications_by_state_id(id,page = 1, per_page = 10)
      joins(:state).where("application_request.state_id = ?", id)
        .paginate(:page => page,:per_page => per_page)
  end

  def self.load_applications_by_professor_id(id,page = 1, per_page = 10)
      joins(:professor).where("professor_id = ?", id)
        .paginate(:page => page,:per_page => per_page)
  end

end
