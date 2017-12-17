module ApplicationHelper
  def index_action?
    params[:action] == 'index'
  end
end
