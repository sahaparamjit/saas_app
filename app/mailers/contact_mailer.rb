class ContactMailer < ActionMailer::Base
    mail = 'sahaparamjit@gmail.com'
    default to: mail
    
    def contact_email(name, email, body)
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Contact for Message')
    end
    def contact_cust(name, email)
        @cust = name
        @custemail = email
        mail(to: @custemail, subject: 'DevMatch | Thanks for contacting us.')
    end
end