class Evaluation < ApplicationRecord
  has_one    :evaluator
  belongs_to :application_request

  validates :state, presence: true
end
