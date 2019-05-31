class UsersController < ApplicationController
  before_action :return_logged_in_user, only: :new
  before_action :authenticate_user!, only: :edit
  before_action :set_categories, only: [:show,:edit]
  require "payjp"

  def show  # ユーザー個人ページ、自分の出品した商品を出品ステータス別に得る
  end

  def new
    case params[:url]
    when "registration" then
      @email = session["devise.facebook_data"]["info"]["email"] if session["devise.facebook_data"]
      @email = session["devise.google_data"]["extra"]["id_info"]["email"] if session["devise.google_data"]
      @password = SecureRandom.urlsafe_base64  if session["devise.facebook_data"] || session["devise.google_data"]
      @user = User.new
      render "users/signup/#{params[:url]}"
    when "address" then
      @user = User.new(user_params)
      if @user.valid_columns?(:name,:email,:password,:password_confirmation,:last_name,:first_name,:last_name_kana,:first_name_kana,:birthday) && verify_recaptcha
        session[:name] = params[:user][:name]
        session[:email] = params[:user][:email]
        session[:password] = params[:user][:password]
        session[:password_confirmation] = params[:user][:password_confirmation]
        session[:last_name] = params[:user][:last_name]
        session[:first_name] = params[:user][:first_name]
        session[:last_name_kana] = params[:user][:last_name_kana]
        session[:first_name_kana] = params[:user][:first_name_kana]
        session[:"birthday(1i)"] = params[:user][:"birthday(1i)"]
        session[:"birthday(2i)"] = params[:user][:"birthday(2i)"]
        session[:"birthday(3i)"] = params[:user][:"birthday(3i)"]
        render "users/signup/#{params[:url]}"
      else
        render "/users/signup/registration"
      end
    when "card" then
      @user = User.new(user_params)
      if @user.valid_columns?(:postal_code,:prefecture,:city,:address,:building,:phone)
        session[:postal_code] = params[:user][:postal_code]
        session[:prefecture] = params[:user][:prefecture]
        session[:city] = params[:user][:city]
        session[:address] = params[:user][:address]
        session[:building] = params[:user][:building]
        session[:phone] = params[:user][:phone]
        render "users/signup/#{params[:url]}"
      else
        render "/users/signup/address"
      end
    when "complete"
      Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
      customer = Payjp::Customer.create(card: params[:payjp_token])
      @user = User.new(name: session[:name],email: session[:email],password: session[:password],password_confirmation: session[:password_confirmation],last_name: session[:last_name],first_name: session[:first_name],last_name_kana: session[:last_name_kana],first_name_kana: session[:first_name_kana],"birthday(1i)": session[:"birthday(1i)"],"birthday(2i)": session[:"birthday(2i)"],"birthday(3i)": session[:"birthday(3i)"],postal_code: session[:postal_code],prefecture: session[:prefecture],city: session[:city],address: session[:address],building: session[:building],phone: session[:phone],payjp_id: customer.id)
      @user[:seller_id] = 1
      @user[:buyer_id] = 1
      if session["devise.facebook_data"]
        @user[:provider] = session["devise.facebook_data"]["provider"]
        @user[:uid] = session["devise.facebook_data"]["uid"]
      elsif session["devise.google_data"]
        @user[:provider] = session["devise.google_data"]["provider"]
        @user[:uid] = session["devise.google_data"]["uid"]
      end
      if @user.save
        @user[:seller_id] = @user.id
        @user[:buyer_id] = @user.id
        @user.save
        reset_session
        sign_in @user
        render "users/signup/#{params[:url]}"
      else
        render "users/signup/card"
      end
    else
      @error_message = session[:error_message]
      reset_session
      session[:state] = "registration"
    end
  end


  def logout
  end

  def edit
    render "users/mypage/#{params[:url]}"
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def return_logged_in_user
    redirect_to root_path if user_signed_in?
  end

  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday,:postal_code,:prefecture,:city,:address,:building,:phone,:profile)
  end

end
