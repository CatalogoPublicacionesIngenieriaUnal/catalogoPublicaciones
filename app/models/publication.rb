class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :keyword_publications
  has_many :keywords, through: :keyword_publications

  belongs_to :theme
  belongs_to :category

  belongs_to :application_request

  before_validation(on: :create) do
    app = ApplicationRequest.create!(state: 0)
    self.application_request_id = app.id
  end


end
