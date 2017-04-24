class KeywordPublication < ApplicationRecord
  belongs_to :keyword
  belongs_to :publication
end
