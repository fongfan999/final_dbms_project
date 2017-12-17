module ApplicationHelper
  def index_action?
    params[:action] == 'index'
  end

  def flash_class(key)
    key == 'notice' ? 'success' : 'danger'
  end
end
