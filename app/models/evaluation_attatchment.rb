class EvaluationAttatchment < ApplicationRecord
  belongs_to :evaluation
  mount_uploader :pdf_document, EvaluationPdfUploader

  validates :evaluator, presence: true

  def title
    evaluation.application_request.publication.title
  end

  def evaluator_name
    evaluation.evaluator.get_name.parameterize.underscore
  end

  def application_request_id
    evaluation.application_request_id
  end

end
