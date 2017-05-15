class EditorialConceptCriterium < ApplicationRecord
  has_many :application_request_editorial_concept_criteria
  has_many :application_requests, through: :ed_con_app_requests

  validates :criterium, presence: true

end
