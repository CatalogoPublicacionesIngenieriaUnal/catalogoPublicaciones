class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :keywords
  has_many :themes
  has_many :categorys
  
  belongs_to :application_request
end