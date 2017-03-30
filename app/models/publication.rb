class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  has_many :keywords
  belongs_to :application_request
end
