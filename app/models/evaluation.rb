class Evaluation < ApplicationRecord
  has_one    :evaluator
  belongs_to :application_request

  has_many :evaluations_criteria
  has_many :criteria, through: :evaluations_criteria

  #validates :state, presence: true, on: :create

  enum state: {sin_evaluar: 1, aprobado: 2, rechazado: 3}

  after_create :create_criteria

  def self.get_publication_by_email(email)
    includes(:evaluator).where(evaluators:{email: email})
  end

  private

  def create_criteria
    Criterium.all.each do |criterium|
      EvaluationsCriterium.create!(evaluation_id: self.id, criterium_id: criterium.id, score: 0)
    end
  end
end
