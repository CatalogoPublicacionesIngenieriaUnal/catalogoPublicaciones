class Keyword < ApplicationRecord

  def self.load_keywords_by_publication(pb_id)
    where('publication_id': pb_id)
  end

end
