class Evaluator < ApplicationRecord
  belongs_to   :evaluation
  belongs_to  :language

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :code, presence: true
  validates :url_token, presence: true, uniqueness: true
  validates :failed_attempts, presence: true

  before_validation(on: :create) do
    self.code = Sysrandom.hex(8)
    self.code_asigned_at = DateTime.now
    self.url_token = Sysrandom.urlsafe_base64(32)
    self.is_locked = false
  end

  def self.evaluator_by_email(email)
    where(email: email).first
  end

end
