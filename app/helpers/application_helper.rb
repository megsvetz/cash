module ApplicationHelper

  def active_for_page(scope)
    controller, action = *scope.split('#')
    if params[:controller] == controller && params[:action] == action
      return "active"
    end
  end

  def current_family
    @current_family ||= Family.where(id: session[:id]).first
  end

  def family_signed_in?
    current_family.present?
  end

end
