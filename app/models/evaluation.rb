class Evaluation < ApplicationRecord

  validates :concept, :justification, presence: true
end
