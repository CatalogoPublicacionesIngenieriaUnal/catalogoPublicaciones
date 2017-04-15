class JudgeMailer < ApplicationMailer
	default from: 'sirchoncho@gmail.com'

  def welcome(evaluator)
    @evaluator = evaluator
		mail(to: evaluator.email,
	         subject: "Already rendered!")
  end
end
