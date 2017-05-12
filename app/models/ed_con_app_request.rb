class EdConAppRequest < ApplicationRecord
  belongs_to :editorial_concept_criterium
  belongs_to :application_request

  validates :score, presence: true
  validates :remark, presence: true

  def self.crit_shit(req, crit)
    find_by(application_request_id: req, editorial_concept_criterium_id: crit)
  end
end
