# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
    @error_message=session[:error_message]
    reset_session
    session[:state]="registration"
  end

  # POST /resource/sign_in
  def create
    super
    @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_steps_path
        else
          render :new
        end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
