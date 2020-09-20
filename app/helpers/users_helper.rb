module UsersHelper
  def flash_class
    # @user.errors.full_messages
    # @user.errors.any?
    if flash[:notice]
      "is-success"
    elsif flash[:alert]
      "is-error"
    end
  end

  def button_language(user)
    if user.new_record?
      "Create Account"
    else
      "Update Account"
    end
  end

  def header_language(user)
    if user.new_record?
      "Sign Up"
    else
      "#{user.name.capitalize}"
    end
  end

  def sub_header_language(user)
    if user.new_record?
      "Account Required to Proceed"
    else
      "Update Account Settings"
    end
  end

  def footer_link(user)
    return if user.persisted?
    if user.new_record?
      link_to "Login", new_session_path, {class: "footer-link"}
    elsif user.persisted?
      link_to "Signup", new_user_path, {class: "footer-link"}
    else
      #add conditional for logged in
    end
  end
end
