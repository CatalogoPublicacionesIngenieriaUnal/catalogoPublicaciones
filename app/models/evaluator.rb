class Evaluator < ApplicationRecord
  has_many :evaluations
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :code, presence: true
  belongs_to :language

end
