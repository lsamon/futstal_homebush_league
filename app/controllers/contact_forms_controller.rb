# frozen_string_literal: true

class ContactFormsController < ApplicationController

  def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request
    @contact.deliver
    
    flash[:success] = "Thank you for your message. I'll get back to you soon!"
    redirect_to contact_path
  rescue StandardError => e
      flash[:error] = "Message did not send."
      Rails.logger.error e.message
      redirect_to contact_path
  end
end