class Professor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  has_many :professor_publications
  has_many :publications, through: :professor_publications
  has_many :professor_application_requests
  has_many :application_requests

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true


  enum gender: {Masculino: 1, Femenino: 2}
  enum department:
  { 'Departamento de ingeniería civil y agrícola': 1,
    'Departamento de ingeniería de sistemas e industrial': 2,
    'Departamento de ingeniería eléctrica y electrónica': 3,
    'Departamento de ingeniería mecánica y mecatrónica': 4,
    'Departamento de ingeniería química y ambiental': 5,
    'Instituto de extensión e investigación IEI': 6
  }

  enum identity_document_type:
  {
    'Cédula de ciudadanía': 1,
    'Cédula de extranjería': 2,
    'Pasaporte': 3
  }

  enum dependency:
  {
    'Vicedecanatura académica': 1,
    'Vicedecanatura de investigación y extensión': 2,
    'Dirección de bienestar': 3,
    'Programa de relaciones internacionales': 4,
    'Escuela doctoral': 5
  }

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
