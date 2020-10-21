module UsersHelper

  def button_language(user)
    if user.new_record?
      "Create Account"
    else
      "Update Account"
    end
  end

  def user_image(user)
    user.photo.present? ? "users/#{user.photo}" : "https://bulma.io/images/placeholders/128x128.png" 
  end

  def user_bio(user)
    user.bio.present? ? user.bio : "Say something about yourself ..." 
  end

  def user_location(user)
    user.location.present? ? user.location : "Where do you live?"
  end

end
