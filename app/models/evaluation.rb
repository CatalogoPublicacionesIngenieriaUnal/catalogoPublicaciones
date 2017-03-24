class Evaluation < ApplicationRecord
  belongs_to :state
  belongs_to :evaluador
  belongs_to :application_request

  validates :concept, :justification, presence: true
end
