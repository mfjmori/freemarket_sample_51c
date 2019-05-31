require 'digest/md5'

class ApplicationController < ActionController::Base

    before_action :authenticate, if: :production?
    before_action :configure_permitted_parameters, if: :devise_controller?

    def production?
      Rails.env.production?
    end

    username = Rails.application.credentials.basic_auth[:user]
    password = Rails.application.credentials.basic_auth[:password]

    REALM = 'SecretZone'.freeze
    USERS = { username => Digest::MD5.hexdigest([username, REALM, password].join(':'))}.freeze

    def set_categories
      @categories = Category.all
    end

    private

    def authenticate
      authenticate_or_request_with_http_digest(REALM) do |username|
        USERS[username]
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:prefecture,:city,:address,:building,:phone,:birthday,:money,:point,:seller_id,:buyer_id,:profile, :payjp_id])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:prefecture,:city,:address,:building,:phone,:birthday,:money,:point,:seller_id,:buyer_id,:profile, :payjp_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:prefecture,:city,:address,:building,:phone,:birthday,:money,:point,:seller_id,:buyer_id,:profile, :payjp_id])
    end
end
