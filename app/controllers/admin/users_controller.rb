# frozen_string_literal: true

class Admin::UsersController < ApplicationController
	before_action :authenticate_user! # Проверка аутентификации

	def index 
		@pagy, @users = pagy User.order(created_at: :desc)
	end


	private

	def user_params
	  params.require(:user).permit(:email, :password, :password_confirmation, :username)
	end
end