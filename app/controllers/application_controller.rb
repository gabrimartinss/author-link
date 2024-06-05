class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale]
      if I18n.locale != cookies[:locale].to_sym
        I18n.locale = cookies[:locale].to_sym
      end
    end 
  end
end