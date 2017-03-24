class Professor < ApplicationRecord

  validates: :user, :name, :lastname, :departament, :email, presence: true
  validates: :user, :email, uniqueness: true
end
