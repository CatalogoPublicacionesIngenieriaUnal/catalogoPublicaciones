class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  has_many :keyword_publications
  has_many :keywords, through: :keyword_publications

  belongs_to :theme
  belongs_to :category

  belongs_to :application_request

  before_validation(on: :create) do
    application_request = ApplicationRequest.create!(state: :en_espera)
    self.application_request_id = application_request.id
  end


  def publications_by_professor(professor_id)
    includes(:professor_publications,:professors).where(professors:{id: professor_id})
  end
  
  accepts_nested_attributes_for :keywords

end
