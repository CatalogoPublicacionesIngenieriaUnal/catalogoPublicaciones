class Administrator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :rememberable, :trackable, :validatable,
  :authentication_keys => [:username]

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  before_validation :set_password, on: :create

  private

  def set_password
    generated_password = Devise.friendly_token
    puts "Contraseña = #{generated_password}"
    self.password = generated_password
    self.first_update = false
  end

end
