class Language < ApplicationRecord
  has_many :judges

  validates :name, presence: true
end
