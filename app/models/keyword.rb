class Keyword < ApplicationRecord
  has_many :keyword_publications
  has_many :publications, through: :keyword_publications
end
