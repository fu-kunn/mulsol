class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: '[問い合わせ]' + @contact.subject
  end
end