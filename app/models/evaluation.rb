class Evaluation < ApplicationRecord
  has_one    :evaluator
  belongs_to :application_request

  has_many :evaluations_criteria
  has_many :criteria, through: :evaluations_criteria

  #validates :state, presence: true, on: :create

  enum state: {sin_evaluar: 1, aprobado: 2, rechazado: 3}

  after_create :create_criteria

  def self.publication_by_evaluator(evaluator)
    includes(:evaluator).where(evaluators:{id: evaluator})
  end

  private

  def create_criteria
    Criterium.all.each do |criterium|
      EvaluationsCriterium.create!(evaluation_id: self.id, criterium_id: criterium.id, score: 0)
    end
  end
end
