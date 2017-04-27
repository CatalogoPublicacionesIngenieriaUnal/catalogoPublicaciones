class Criterium < ApplicationRecord
  has_many :evaluations_criteria

  validates :criterion, presence: true
  validates :criterion_type, presence: true

  enum criterion_type: { general: 1, writing: 2 }
end
