class Administrator < ApplicationRecord
  validates :email, :name, :lastname, presence: true
  validates :email, uniqueness: true
end
