class ContactMailer < ActionMailer::Base
    default to: 'sahaparamjit@gmail.com'
    
    def contact_email(name, email, body)
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Contact for Message')
    end
end