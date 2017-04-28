class Attatchment < ApplicationRecord
  belongs_to :application_request
  validates :url, presence: true
  validates :category, presence: true

  enum category: { carta_presentacion: 1, concepto_editorial_a: 2, manuscrito: 3 }
  mount_uploader :pdf_document, AttachmentUploader

  before_validation :update_attachment_attributes

  def self.get_attachment_by_category(category)
    where(category: category).first
  end

  private

  def update_attachment_attributes
    self.url = pdf_document.store_dir
  end
end
