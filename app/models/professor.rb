class Professor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  default_scope {order("professors.created_at DESC")}

  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests, through: :professor_application_requests

  validates :username, :name, :lastname, :departament, :email, presence: true
  validates :username, :email, uniqueness: true

   def self.load_professors_pending_approval(page = 1, per_page = 10)
       where("validated = ?", false)
         .paginate(:page => page,:per_page => per_page)
   end

   def ldap_before_save
     self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
     self.name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenname").first
     self.lastname = Devise::LDAP::Adapter.get_ldap_param(self.username,"sn").first
     self.departament = "hgghgjhg"
   end
end
