class Evaluation < ApplicationRecord
  has_one    :evaluator
  belongs_to :application_request

  validates :state, presence: true

  enum state: {sin_evaluar: 1, aprobado: 2, rechazado: 3}

  def self.get_publication_by_email(email)
    includes(:evaluator).where(evaluators:{email: email})
  end
end
