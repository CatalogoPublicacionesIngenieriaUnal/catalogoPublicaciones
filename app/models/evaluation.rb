class Evaluation < ApplicationRecord
  has_one    :evaluator
  belongs_to :application_request

  has_many :evaluations_criteria
  has_many :criteria, through: :evaluations_criteria

  validates :state, presence: true, on: :create

  enum state: [:sin_evaluar, :aprobado, :ligeras_modificaciones, :modificaciones_sustanciales, :rechazado]

  after_create :create_criteria

  def self.publication_by_evaluator(evaluator)
    includes(:evaluator).where(evaluators:{id: evaluator})
  end

  def publication
    application_request.attatchments.where(category: :manuscrito).first
  end

  def finish
    errors.add(:publication_clasiffication, :blank, message: "Debe seleccionar al menos una Clasificación de la publicacíon") if publication_clasiffication.blank?
    errors.add(:publication_synopsis, :blank, message: "Sinopsis de la publicacíon no debe estar en blanco") if publication_synopsis.blank?
    errors.add(:general_score_justification, :blank, message: "No debe dejar Justificación general en blanco") if general_score_justification.blank?
    errors.add(:writing_score_jistification, :blank, message: "No debe dejar Justificación de escritura en blanco") if writing_score_jistification.blank?
    errors.add(:disclosure_degree, :blank, message: "Debe seleccionar al menos un grado de divulgacion") if disclosure_degree.blank?
    errors.add(:target_audience, :blank, message: "Debe seleccionar al menos una audiencia objetivo") if target_audience.blank?
    errors.add(:target_audience_remark, :blank, message: "No debe dejar campos en blanco") if target_audience_remark.blank?
  end

  private

  def create_criteria
    self.finished = false
    Criterium.all.each do |criterium|
      EvaluationsCriterium.create!(evaluation_id: self.id, criterium_id: criterium.id, score: 0)
    end
  end

end
