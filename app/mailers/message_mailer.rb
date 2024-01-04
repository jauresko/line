class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message.subject
  #
  def message
    @receiver = params[:receiver]
    mail(to: @receiver.email, subject: 'You just receive a message')
  end
end
