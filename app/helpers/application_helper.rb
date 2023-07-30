module ApplicationHelper
  def logged_in?
      session[:user_id].present?
  end

  def page_title(page_title = '')
    base_title = 'My Cinema Record'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
