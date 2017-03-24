class Attachment < ApplicationRecord

  validates: :url, :type, presence: true
end
