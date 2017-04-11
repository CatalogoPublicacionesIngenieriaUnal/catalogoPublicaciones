class Evaluation < ApplicationRecord
  belongs_to :evaluator
  belongs_to :application_request
end
