class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  has_many :keywords
  belongs_to :application_request

  def find_publications_by_professor(page = 1, per_page = 10)
    where("validated = ?", false)
      .paginate(:page => page,:per_page => per_page)
  end

end
