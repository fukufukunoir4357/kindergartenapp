class ContactMailer < ApplicationMailer
  
  def send_when_admin_reply(contact)
    @answer = contact.reply
    mail to: contact.email, subject: '【八王子すみれ幼稚園】お問い合わせありがとうございます'
  end
  
end
