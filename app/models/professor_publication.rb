class ProfessorPublication < ApplicationRecord
  belongs_to :professor
  belongs_to :publication
end
