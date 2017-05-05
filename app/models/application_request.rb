class ApplicationRequest < ApplicationRecord

  has_many :attatchments
  has_many :evaluations
  has_many :evaluators, through: :evaluations

  has_one :publication
  belongs_to :professor

  validates :state, presence: true

  enum state: ['En creación','En espera', 'En evaluación', 'Aprobado', 'Rechazado']

  def self.load_applications_by_state_id(id,page = 1, per_page = 10)
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

end
