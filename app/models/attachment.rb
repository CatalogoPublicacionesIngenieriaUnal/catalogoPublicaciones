class Attachment < ApplicationRecord
  belongs_to :application_request
  
  validates :url, :type, presence: true
end
