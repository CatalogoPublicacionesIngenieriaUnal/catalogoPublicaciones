class Attatchment < ApplicationRecord
  belongs_to :application_request
  validates :category, presence: true
  validate :document_already_loaded?

  enum category: [:carta_presentacion, :concepto_editorial_a, :concepto_editorial_b, :manuscrito]
  mount_uploader :pdf_document, AttachmentUploader

  def self.get_attachment_by_category(category)
    where(category: category).first
  end

  def publication_title
    application_request.publication.title
  end

  private

  def document_already_loaded?
    errors.add(:attatchments, 'Document Already Loaded') if ApplicationRequest
      .find(application_request_id).document_loaded?(category)
  end

  def publication_complete?
    application_request.publication.request_completeness == 100
  end
end
