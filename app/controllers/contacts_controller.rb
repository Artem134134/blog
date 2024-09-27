# frozen_string_literal: true

class ContactsController < ApplicationController
  include ContactsHelper
 # include ActionView::RecordIdentifier на будущее dom_id или работа с формами
  
  before_action :authenticate_user!, only: %i[new create]
  before_action :authorize_contact!, only: %i[new create]
  after_action :verify_authorized, only: %i[new create] # метод из pundit

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid? && valid_email?(@contact.email)
      @contact.save
      flash[:success] = t '.success'
      redirect_to root_path
    else
      flash.now[:warning] = t '.warning'
      @invalid_email = !valid_email?(@contact.email)
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

  def authorize_contact!
    authorize(@contact || Contact)
  end
end
