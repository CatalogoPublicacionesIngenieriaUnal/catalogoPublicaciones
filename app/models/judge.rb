class Judge < ApplicationRecord

  validates :user, :name, :lastname, :email, :telephone, presence: true
  validates :user, :email, uniqueness: true
end
