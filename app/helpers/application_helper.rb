module ApplicationHelper

  def flash_class
    if flash[:notice]
      "is-success"
    elsif flash[:alert]
      "is-error"
    end
  end

  def auth_header_language(user)
    if user.new_record?
      "Sign Up"
    else
      "#{user.name.capitalize}"
    end
  end

  def auth_sub_header_language(user)
    if user.new_record?
      "Account Required to Proceed"
    else
      "Account Settings"
    end
  end

  def auth_footer_link(user)
    return if user.persisted?
    if user.new_record?
      link_to "Login", new_session_path, {class: "footer-link"}
    elsif user.persisted?
      sign_up_user
    end
  end

  def sign_up_user
    link_to "Sign Up", new_user_path, {class: "footer-link"}
  end
end
