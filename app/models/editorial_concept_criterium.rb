class EditorialConceptCriterium < ApplicationRecord
  has_many :application_request_editorial_concept_criteria
  has_many :application_requests, through: :application_request_editorial_concept_criteria

  validates :critrium, presence: true
  
end
