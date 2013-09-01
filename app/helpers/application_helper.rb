module ApplicationHelper
  def currently_active(path)
    'active' if current_page?(path) 
  end
end
