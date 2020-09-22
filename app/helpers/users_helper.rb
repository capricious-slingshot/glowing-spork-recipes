module UsersHelper

  def button_language(user)
    if user.new_record?
      "Create Account"
    else
      "Update Account"
    end
  end

end
