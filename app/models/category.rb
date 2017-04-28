class Category < ApplicationRecord
  has_many :publications
  validates :category, presence: true
end
