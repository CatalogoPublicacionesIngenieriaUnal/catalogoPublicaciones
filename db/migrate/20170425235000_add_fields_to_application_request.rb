class AddFieldsToApplicationRequest < ActiveRecord::Migration[5.0]
  def change
    change_table :application_requests do |t|
      t.string  :author_topic
      t.string  :author_target_audience
      t.string  :author_positioning_strategies
      t.string  :author_academic_appreciation
      t.text    :author_published_titles
      t.text    :author_final_recomendation
    end
  end
end
