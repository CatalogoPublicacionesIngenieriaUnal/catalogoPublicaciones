class ApplicationRequest < ApplicationRecord
  has_many :attatchments
  has_many :professor_application_requests
  has_many :professors, through: :professor_application_requests
  has_many :evaluations
  
end
