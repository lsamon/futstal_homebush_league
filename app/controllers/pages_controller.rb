# frozen_string_literal: true

class PagesController < ApplicationController
	layout "public"
	
  def index; end
  def contact
  	@contact = ContactForm.new(params[:home])
  end
end
