class ApplicationRequest < ApplicationRecord
  has_many :attachments
  has_many :proffessor_application_requests
  has_many :professors, through: :proffessor_application_requests
  has_many :evaluations
  belongs_to :state
  
  validates :url, presence: true
end
