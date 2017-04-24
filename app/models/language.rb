class Language < ApplicationRecord
  has_many :evaluators
  validates :name, presence: true
end
