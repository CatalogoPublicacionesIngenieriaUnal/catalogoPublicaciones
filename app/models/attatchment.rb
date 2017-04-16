class Attatchment < ApplicationRecord
  belongs_to :application_request
  mount_uploader :url, FileUploader
end
