# frozen_string_literal: true

class ContactsController < ApplicationController
  include ContactsHelper

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
end
