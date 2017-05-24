class SendEvaluationMailer < ApplicationMailer

  default from: 'sirchoncho@gmail.com'

  def self.sendEmailEvaluation(administrator,publication,professor)
    @administrators = administrator
    @administrators.each do |admin|
      sendEvaluation(admin.email,admin,publication,professor).deliver_now
    end
  end

  def sendEvaluation(email,administrator,publication,professor)
    @administrator = administrator
    @publication = publication
    @professor = professor

    mail(to: email, subject: "Se ha creado una nueva evaluación")

  end


end
