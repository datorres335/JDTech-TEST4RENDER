class ProfilesController < ApplicationController
  def show
  end

  def order_history
  end

  def favorites
  end

  def account_settings
  end

  def start_return
  end

  def contact_us
  end 

  def logout
    # Implement logout logic here
  end

  def send_contact
    name = params[:name]
    user_email = params[:email]
    message = params[:message]
    ticket_number = params[:ticket_number]

    # Send confirmation email to user
    ContactMailer.user_confirmation(name, user_email, message, ticket_number).deliver_now

    # Send notification email to support
    ContactMailer.support_notification(name, user_email, message, ticket_number).deliver_now

    redirect_to contact_us_path, notice: 'Your message has been sent.'
  end
end