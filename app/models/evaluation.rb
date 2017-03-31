class Evaluation < ApplicationRecord
  belongs_to :state
  belongs_to :judge
  belongs_to :application_request

end
