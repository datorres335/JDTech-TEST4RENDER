class ContactMailer < ApplicationMailer
    default from: 'support@yourdomain.com' # Set a default sender email

    # Email sent to the user
    def user_confirmation(name, user_email, message, ticket_number)
        @name = name
        @message = message
        @ticket_number = ticket_number

        mail(to: user_email, subject: "[JDTech Help] Ticket ##{@ticket_number}") do |format|
            format.text { render plain: "Thank you for contacting us. Your ticket number is #{@ticket_number}.\n\nYour message:\n#{@message}\n\nWe will respond to your inquiry within 1-4 business days.\n\nBest regards,\nJDTech Support Team" }
        end
    end

    # Email sent to support
    def support_notification(name, user_email, message, ticket_number)
        @name = name
        @message = message
        @ticket_number = ticket_number

        mail(to: 'jdtech.help0@gmail.com', subject: "[JDTech Help] New Ticket ##{@ticket_number}") do |format|
            format.text { render plain: "User: #{name} (#{user_email})\n\nMessage:\n#{@message}" }
        end
    end
end
