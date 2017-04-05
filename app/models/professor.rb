class Professor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  default_scope {order("professors.created_at DESC")}

  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests, through: :professor_application_requests

  validates :username, :name, :lastname, :departament, :email, presence: true
  validates :username, :email, uniqueness: true

  before_validation :get_ldap_email
   def get_ldap_email
     self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
   end

   # use ldap uid as primary key
   before_validation :get_ldap_id
   def get_ldap_id
     self.id = Devise::LDAP::Adapter.get_ldap_param(self.username,"uidnumber").first
   end

   # hack for remember_token
   def authenticatable_token
     Digest::SHA1.hexdigest(email)[0,29]
   end


   def self.load_professors_pending_approval(page = 1, per_page = 10)
       where("validated = ?", false)
         .paginate(:page => page,:per_page => per_page)
   end

end
