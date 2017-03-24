class ApplicationRequest < ApplicationRecord
  validates :url, presence: true
end
