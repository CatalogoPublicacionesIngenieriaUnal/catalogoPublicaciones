class EdConAppRequest < ApplicationRecord
  belongs_to :editorial_concept_criterium
  belongs_to :application_request

  validates :score, presence: true
  validates :remark, presence: true
end
