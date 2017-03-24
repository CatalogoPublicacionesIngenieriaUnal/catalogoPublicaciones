class State < ApplicationRecord

  validates: :name, :verifier, presence: true
  validates: :name, uniqueness: true
end
