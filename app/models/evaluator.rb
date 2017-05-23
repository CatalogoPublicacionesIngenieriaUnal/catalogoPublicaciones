class Evaluator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :evaluation
  belongs_to :language

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :position, presence: true, on: :update
  validates :institution, presence: true, on: :update
  validates :degree, presence: true, on: :update
  validates :degree_institution, presence: true, on: :update
  validates :contact_number, presence: true, on: :update

  before_validation :set_password, on: :create

  def self.evaluator_by_email(email)
    where(email: email).first
  end

  def get_name
    first_name + ' ' + last_name
  end


  private

  def set_password
    generated_password = Devise.friendly_token
    puts "Contraseña = #{generated_password}"
    self.password = generated_password
    self.first_update = false
  end
end
