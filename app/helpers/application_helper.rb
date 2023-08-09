module ApplicationHelper
  def logged_in?
      session[:user_id].present?
  end

  def page_title(page_title = '')
    base_title = 'My Cinema Record'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def top_ranking_crown(rank)
    crown_icons = [
      '<i class="fa fa-crown" style="color:#fff700"></i>',
      '<i class="fa fa-crown" style="color:#CCCCCC"></i>',
      '<i class="fa fa-crown" style="color:#c27100"></i>',
    ]
    crown_icons[rank].html_safe
  end

end
