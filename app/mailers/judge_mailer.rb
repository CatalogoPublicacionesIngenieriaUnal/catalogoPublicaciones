class JudgeMailer < ApplicationMailer
	default from: 'sirchoncho@gmail.com'

  def welcome(evaluator,password)

		@evaluator = evaluator
		@password = password

		I18n.locale = :es

		I18n.with_locale(I18n.locale) do
			mail(to: evaluator.email,
		         subject: "Catalogo de publicaciones - Nuevo evaluador!")
    end
	end
end
