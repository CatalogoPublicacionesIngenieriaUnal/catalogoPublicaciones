class Evaluation < ApplicationRecord
  has_one :evaluator
  has_one :evaluation_attatchment

  belongs_to :application_request

  has_many :evaluations_criteria
  has_many :criteria, through: :evaluations_criteria

  validates :state, presence: true, on: :create
  validates :finished, default: false

  enum state: [:sin_evaluar, :aprobado, :ligeras_modificaciones, :modificaciones_sustanciales, :rechazado]
  after_create :create_criteria

  def self.publication_by_evaluator(evaluator)
    includes(:evaluator).where(evaluators:{id: evaluator})
  end

  def self.completed
    where(finished: true)
  end

  def publication
    application_request.attatchments.where(category: :manuscrito).first
  end

  def evaluation_complete
    self.update(finished: true)
    evaluator.update(locked_at: DateTime.now)
    application_request.evaluation_complete
  end

  def finish
    errors.add(:publication_clasiffication, :blank, message: "Debe seleccionar al menos una Clasificación de la publicacíon") if publication_clasiffication.blank?
    errors.add(:publication_synopsis, :blank, message: "Sinopsis de la publicacíon no debe estar en blanco") if publication_synopsis.blank?
    errors.add(:general_score_justification, :blank, message: "No debe dejar Justificación general en blanco") if general_score_justification.blank?
    errors.add(:writing_score_jistification, :blank, message: "No debe dejar Justificación de escritura en blanco") if writing_score_jistification.blank?
    errors.add(:disclosure_degree, :blank, message: "Debe seleccionar al menos un grado de divulgacion") if disclosure_degree.blank?
    errors.add(:target_audience, :blank, message: "Debe seleccionar al menos una audiencia objetivo") if target_audience.blank?
    errors.add(:target_audience_remark, :blank, message: "No debe dejar campos en blanco") if target_audience_remark.blank?
    errors.add(:evaluation_attatchment, :nil, message: "Debe cargar la evaluación firmada") if evaluation_attatchment.nil?
  end

  def title
    application_request.publication.title
  end

  private

  def create_criteria
    Criterium.all.each do |criterium|
      EvaluationsCriterium.create!(evaluation_id: self.id, criterium_id: criterium.id, score: 0)
    end
  end

end
