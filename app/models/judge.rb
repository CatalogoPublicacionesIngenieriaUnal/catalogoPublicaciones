class Judge < ApplicationRecord
  belongs_to :language
  has_many :evaluations
  
  validates :user, :name, :lastname, :email, :telephone, presence: true
  validates :user, :email, uniqueness: true
end
