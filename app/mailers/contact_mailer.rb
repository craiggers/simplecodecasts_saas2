class ContactMailer < ActionMailer::Base
    # Assign email address to send to
    default to: 'segaismysavior@hotmail.com'
    
    def contact_email(name, email, body)
        # Assign Instance variables
        @name = name
        @email = email
        @body = body
        mail(from: email, subject: 'Contact Form Message')
    end
end