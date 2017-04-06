class Judge < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :language
  has_many :evaluations

  validates :user, :name, :lastname, :email, :telephone, presence: true
  validates :user, :email, uniqueness: true
end
