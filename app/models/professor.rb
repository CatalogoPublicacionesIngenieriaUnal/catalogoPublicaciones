class Professor < ApplicationRecord
  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests, through: :professor_application:requests
end
