class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  has_many :keywords
  belongs_to :application_request

  def self.publication_by_id_judge(id)
    includes(:keywords)
        .find_by_id(id)
  end

end
