class Publication < ApplicationRecord
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  has_many :keywords
  belongs_to :application_request

  def self.load_publications(page = 1, per_page = 10)
    includes(:professors, :keywords, application_request:[:evaluations]).paginate( :page=> page, :per_page => per_page)
  end

  def self.load_publications_by_theme(theme, page = 1, per_page = 10)
    where(theme: theme).paginate( :page=> page, :per_page => per_page)
  end

  def self.load_publications_by_category(category, page = 1, per_page = 10)
    where(category: category).paginate( :page=> page, :per_page => per_page)
  end

  def self.load_publications_by_keyword(keyw, page = 1, per_page = 10)
    #joins(:keywords).select("publications.*").where( keywords:{ "keyword = ?", keyw} )
    joins(:keywords).select("publications.*").where( 'keywords.keyword = ?', keyw )
  end

  def self.load_publications_by_status(state, page = 1, per_page = 10)
    #joins(:application_request).select("publications.*").where( application_request:{ 'state_id = ?', state } )
    joins(:application_request).select("publications.*").where( 'state_id = ?', state  )
  end

  def self.publication_by_id_judge(id)
    includes(:keywords)
        .find_by_id(id)
  end

end
