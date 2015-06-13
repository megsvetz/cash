class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

    def current_family
      @current_family ||= Family.where(id: session[:family_id]).first
    end

   helper_method :current_family

  end
