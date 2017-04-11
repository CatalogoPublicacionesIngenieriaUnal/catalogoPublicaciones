class Evaluator < ApplicationRecord
  has_many :evaluations
  belongs_to :language
end
