class Attachment < ApplicationRecord
  belongs_to :application_request

  validates :url, :category, presence: true
end
