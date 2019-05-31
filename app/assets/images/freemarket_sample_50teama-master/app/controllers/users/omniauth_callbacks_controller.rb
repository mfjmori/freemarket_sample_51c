class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    case session[:state]
    when "session"
      if @user.persisted?
        sign_in @user
        redirect_to root_path
      else
        session[:error_message] = "登録されていません"
        redirect_to new_user_session_path
      end
    when "registration"
      if @user.persisted?
        session[:error_message] = "既に登録されています"
        redirect_to new_user_path
      else
        session["devise.#{provider}_data"] = request.env["omniauth.auth"]
        redirect_to "/users/signup/registration"
      end
    end
  end

  def failure
    redirect_to root_path
  end
end