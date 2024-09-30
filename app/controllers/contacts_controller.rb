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

  # rubocop:disable Metrics/AbcSize
  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user # Устанавливаем текущего пользователя

    if @contact.valid?
      @contact.save
      flash[:success] = t '.success'
      redirect_to new_contacts_path
    else
      flash.now[:warning] = t '.warning'
      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  def contact_params
    params.require(:contact).permit(:message).merge(email: current_user.email)
  end

  def authorize_contact!
    authorize(@contact || Contact)
  end
end
