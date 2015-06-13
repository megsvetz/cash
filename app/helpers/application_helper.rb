module ApplicationHelper

  def active_for_page(scope)
    controller, action = *scope.split('#')
    if params[:controller] == controller && params[:action] == action
      return "active"
    end
  end

  def families_signed_in?
    current_family.present?
  end
end
