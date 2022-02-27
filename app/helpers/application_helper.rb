module ApplicationHelper
  def is_active?(controller, action)
    controller_name == controller && action_name == action ? ' text-white' : ' text-secondary'
  end
end
