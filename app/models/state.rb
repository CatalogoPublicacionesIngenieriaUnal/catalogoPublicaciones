class State < ApplicationRecord
  has_many :application_requests
  has_many :evaluations

  validates :name, :verifier, presence: true
  validates :name, uniqueness: true
end
