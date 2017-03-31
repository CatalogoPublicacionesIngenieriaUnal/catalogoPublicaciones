class Professor < ApplicationRecord

  default_scope {order("professors.created_at DESC")}

  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests, through: :professor_application_requests

  validates :user, :name, :lastname, :departament, :email, presence: true
  validates :user, :email, uniqueness: true

  def self.load_professors_pending_approval(page = 1, per_page = 10)
      where("validated = ?", false)
        .paginate(:page => page,:per_page => per_page)
  end



end
