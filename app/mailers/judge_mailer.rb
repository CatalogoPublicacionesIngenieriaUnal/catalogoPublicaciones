class JudgeMailer < ApplicationMailer
	default from: 'sirchoncho@gmail.com'

  def welcome(evaluator)

		@evaluator = evaluator

		I18n.locale = :en

		I18n.with_locale(I18n.locale) do
			mail(to: evaluator.email,
		         subject: "Catalogo de publicaciones - Nuevo evaluador!")
    end
	end
end
