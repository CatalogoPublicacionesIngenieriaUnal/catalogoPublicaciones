class Criterium < ApplicationRecord
  has_many :evaluations_criteria

  validates :criterion, presence: true
  validates :criterion_type, presence: true

  enum criterion_type: { general: 1, writing: 2 }

  def self.get_general
    where(criterion_type: :general)
  end

  def self.get_writing
    where(criterion_type: :writing)
  end
end
