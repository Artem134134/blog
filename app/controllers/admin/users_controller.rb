# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    before_action :authenticate_user! # Проверка аутентификации
    before_action :set_user!, only: %i[edit update destroy]
    before_action :authorize_user!
    after_action :verify_authorized # метод из pundit

    def index
      respond_to do |format|
        format.html do
          @pagy, @users = pagy User.order(created_at: :desc)
        end

        format.zip { respond_with_zipped_users }
      end
    end

    def new
      @user = User.new
    end

    def edit; end

    def create
      if params[:archive].present?
        UserBulkService.call(params[:archive])
        flash[:success] = t('admin.create.success')
        redirect_to admin_users_path
      else
        @user = User.new(user_params)

        if @user.save
          flash[:success] = t('admin.create.user_success',
                              user: @user.username)
          redirect_to admin_users_path
        else
          flash.now[:warning] = t('admin.create.user_warning')
          @pagy, @users = pagy User.order(created_at: :desc)
          render :new
        end
      end
    end

    def update
      if @user.update user_params
        flash[:success] = t('admin.update.success', user: @user.username)
        redirect_to admin_users_path
      else
        flash.now[:warning] = t('admin.update.warning')
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = t('admin.destroy.success', user: @user.username)
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :username,
                                   :password, :password_confirmation, :old_password,
                                   :role).merge(admin_edit: true)
    end

    def respond_with_zipped_users
      compressed_filestream = Zip::OutputStream.write_buffer do |zos|
        User.order(created_at: :desc).each do |user|
          zos.put_next_entry "user_#{user.username}_#{user.id}.xlsx"
          zos.print render_to_string(
            layout: false, handlers: [:axlsx], formats: [:xlsx],
            template: 'admin/users/user', locals: { user: }
          )
        end
      end

      compressed_filestream.rewind
      send_data compressed_filestream.read, filename: 'users.zip'
    end

    def set_user!
      @user = User.find params[:id]
    end

    def authorize_user!
      authorize(@user || User)
    end
  end
end
