class Professor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests, through: :professor_application_requests
  has_many :application_requests, through: :professor_application_requests

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true

  enum gender: {male: 1, female: 2}


  def ldap_before_save
     self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
     self.first_name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenname").first
     self.last_name = Devise::LDAP::Adapter.get_ldap_param(self.username,"sn").first
     self.is_authorized = false
     self.department = 1;
   end

   def self.load_professors_pending_approval(page = 1, per_page = 10)
       where("validated = ?", false)
         .paginate(:page => page,:per_page => per_page)
   end

   def self.search(is_authorized_params)
     if !is_authorized_params.blank?
       puts "1 if"
       where(["is_authorized = ?", is_authorized_params])
     else
       all
     end
   end

end
