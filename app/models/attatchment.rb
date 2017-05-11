class Attatchment < ApplicationRecord
  belongs_to :application_request
  validates :url, presence: true
  validates :category, presence: true
  validate :document_already_loaded?

  enum category: [:carta_presentacion, :concepto_editorial_a, :manuscrito ]
  mount_uploader :pdf_document, AttachmentUploader

  before_validation :update_attachment_attributes
  after_save  :check_completeness

  def self.get_attachment_by_category(category)
    where(category: category).first
  end

  private
  def update_attachment_attributes
    self.url = pdf_document.store_dir
  end

  def check_completeness
    puts "completo? = #{publication_complete?}"
    application_request.state = 'En espera' if  publication_complete?
    application_request.save!
  end

  def document_already_loaded?
    errors.add(:attatchments, 'Document Already Loaded') if ApplicationRequest
      .find(application_request_id).document_loaded?(category)
  end

  def publication_complete?
    application_request.publication.request_completeness == 100
  end
end
