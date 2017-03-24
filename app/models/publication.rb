class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  belongs_to :application_request
end
