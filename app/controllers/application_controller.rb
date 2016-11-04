# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_user!


  def set_locale
    if cookies[:locale] && I18n.available_locales.include?(cookies[:locale].to_sym)
      l = cookies[:locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:locale] = l
    end
    I18n.locale = l
  end

  def change_locale
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:locale] = l
    redirect_to request.referer || root_url
  end


  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

end
