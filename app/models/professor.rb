class Professor < ApplicationRecord

  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests, through: :professor_application:requests

  def self.load_professors_pending_approval(page = 1, per_page = 10)
    where("validated = ?", false).paginate(:page => page,:per_page => per_page)
  end

end
