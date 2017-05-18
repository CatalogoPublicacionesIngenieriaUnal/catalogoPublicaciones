class Publication < ApplicationRecord

  has_one  :application_request
  has_many :professor_publications
  has_many :professors, through: :professor_publications
  has_many :keyword_publications
  has_many :keywords, through: :keyword_publications
  has_many :attatchments, through: :application_request

  belongs_to :theme
  belongs_to :category


  validates :title, presence: true
  validates :abstract, presence: true
  validates :category, presence: true
  validates :theme, presence: true
  #validates :keyword_publications, length: { is: 3 }

  # before_validation(on: :create) do
  #   self.application_request_id = 1
  # #   application_request = ApplicationRequest.new(state: :en_espera, professors_id: @current_professor)
  # #   application_request.save
  # #   self.application_request_id = application_request.id
  # end


  def request_completeness
    count = 0
    count += application_request.completeness
    count += 1 if keywords.count >= 1
    count += 1 unless abstract.nil?
    count += 1 unless title.nil?
    count += 1 unless theme_id.nil?
    completeness = (count*100)/total_request_fields

    return completeness
  end

  def total_request_fields
    return total_publication_fields + application_request.total_application_fields
  end

  def delete_attatchment(att_category)
    application_request.attatchments.where(category: att_category).first.destroy unless att_type == :concepto_editorial_b
  end


  scope :publications_by_professor, -> (professor_id){
    includes(:professor_publications,:professors).where(professors:{id: professor_id})
  }

  scope :publications_by_keyword, ->(keyword_id){
    includes(:keyword_publications,:keywords).where(keywords:{id: keyword_id})
  }

  def self.search(title_params, category_params)
    if !title_params.blank? && category_params.blank?
      puts "1 if"
      where(["title LIKE ?", "%#{title_params}%"])
    elsif !category_params.blank? && title_params.blank?
      puts "2 if"
      where(["category_id = ?", category_params])
    elsif !title_params.blank? && !category_params.blank?
      puts "3 if"
      where(["category_id = ? and title LIKE ?", category_params, "%#{title_params}%"])
    else
      all
    end
  end

  private
  def total_publication_fields
    # Titulo
    # Tema
    # Abstract
    # Palabras claves
    return 4
  end

end
