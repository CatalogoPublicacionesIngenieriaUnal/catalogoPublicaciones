class Evaluation < ApplicationRecord
  belongs_to :evaluator
  belongs_to :application_request

  validates :state, presence: true
end
