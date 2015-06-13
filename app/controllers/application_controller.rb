class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

    def current_user
      @current_user ||= Family.where(id: session[:family_id]).first

    end

    def current_user
     @current_user ||= Family.where(id: session[:family_id]).first
    end

   helper_method :current_user

  end
