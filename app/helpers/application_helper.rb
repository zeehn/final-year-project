module ApplicationHelper
  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: "active")
    else
      link_to(text, url)
    end
  end

  def user_path
    if current_user 
      if current_user.instance_of?(Admin)
        return edit_admin_path(current_user)
      elsif current_user.instance_of?(Maid)
        return edit_maid_path(current_user)
      else
        return edit_client_path(current_user)
      end
    end
  end
end
