class Attatchment < ApplicationRecord
  belongs_to :application_request

  validates :url, presence: true
  validates :category, presence: true
end
