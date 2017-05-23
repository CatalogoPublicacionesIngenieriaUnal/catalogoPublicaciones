class EvaluationsCriterium < ApplicationRecord
  belongs_to :criterium
  belongs_to :evaluation

  def self.criteria_by_evaluation(eval)
    includes(:evaluation).where(evaluation: eval)
  end

  def self.type_general
    includes(:criterium).where(criteria: {criterion_type: :general})
  end

  def self.type_writing
    includes(:criterium).where(criteria: {criterion_type: :writing})
  end

  def self.curr_evl_gen(evl)
    includes(:criterium).where(evaluation_id: evl, criteria: {criterion_type: :general})
  end

  def self.curr_evl_wri(evl)
    includes(:criterium).where(evaluation_id: evl, criteria: {criterion_type: :writing})
  end

end
