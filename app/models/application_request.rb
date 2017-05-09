class ApplicationRequest < ApplicationRecord

  has_many :attatchments
  has_many :evaluations
  has_many :evaluators, through: :evaluations

  belongs_to :publication
  belongs_to :professor

  validates :state, presence: true

  enum state: ['En creación', 'En espera', 'En evaluación', 'Aprobado', 'Rechazado']

  def document_loaded?(doc_category)
    !attatchments.where(category: doc_category).first.nil?
  end

  def completeness
    documents_loaded + professor_concept_completeness
  end

  def self.load_applications_by_state_id(id, page = 1, per_page = 10)
    includes(:state).where("state_id = ?", id)
  end

  def self.load_applications_by_professor_id(id,page = 1, per_page = 10)
    includes(:professor_application_requests,:professors).where("id = ?",id)
  end

  def self.find_by_evaluation_status(id)
    includes(:evaluations).where('state_id = ?', id)
  end

  def self.get_professor(professor_id)
    includes(:professors).where(professors:{id: professor_id})
  end

  private

  def documents_loaded
    count = 0
    count += 1 if document_loaded?(:carta_presentacion)
    count += 1 if document_loaded?(:concepto_editorial_a)
    count += 1 if document_loaded?(:manuscrito)
    return count
  end

  def professor_concept_completeness
    count = 0
    count += 1 unless author_target_audience.nil?
    count += 1 unless author_positioning_strategies.nil?
    count += 1 unless author_academic_appreciation.nil?
    count += 1 unless author_published_titles.nil?
    count += 1 unless author_final_recomendation.nil?
    return count
  end

  def total_application_fields
    # 3 documentos
    # 5 campos de concepto_editorial
    return 8
  end

end
