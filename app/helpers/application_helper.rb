module ApplicationHelper

  def anyone_singed_in?
    professor_signed_in? ||  administrator_signed_in? || judge_signed_in?
  end
end
