# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_locale
  before_action :authenticate_user!

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    redirect_to request.referer || root_url
  end

  # def change_locale
  #   l = params[:locale].to_s.strip.to_sym
  #   l = I18n.default_locale unless I18n.available_locales.include?(l)
  #   cookies.permanent[:educator_locale] = l
  #   redirect_to request.referer || root_url
  # end

  # def set_locale
  #   if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
  #     l = cookies[:educator_locale].to_sym
  #   else
  #     l = I18n.default_locale
  #     cookies.permanent[:educator_locale] = l
  #   end
  #   I18n.locale = l
  # end


  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

end
