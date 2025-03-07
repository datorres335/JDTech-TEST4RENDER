class ContactController < ApplicationController
    def send_contact
        name = params[:name]
        user_email = params[:email]
        message = params[:message]
        ticket_number = params[:ticket_number]

        # Send confirmation email to user
        ContactMailer.user_confirmation(name, user_email, message, ticket_number)

        # Send notification email to support
        ContactMailer.support_notification(name, user_email, message, ticket_number)

        redirect_to root_path, notice: "Your message has been sent successfully."
    end
end
