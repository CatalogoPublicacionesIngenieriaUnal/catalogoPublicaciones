class JudgeMailer < ApplicationMailer
	default from: 'sirchoncho@gmail.com'

  def welcome(evaluator)
    @evaluator = evaluator
		mail(to: evaluator.email,
	         subject: "Catalogo de publicaciones - Nuevo evaluador!")
  end
end
