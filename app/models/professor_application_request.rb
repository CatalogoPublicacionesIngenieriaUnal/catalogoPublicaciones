class ProfessorApplicationRequest < ApplicationRecord
  belongs_to :professor
  belongs_to :application_request
end
