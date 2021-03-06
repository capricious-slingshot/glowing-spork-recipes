module UsersHelper

  def button_language(user)
    if user.new_record?
      "Create Account"
    else
      "Update Account"
    end
  end

  def user_image(user)
    if user.photo.present? && uri_exists?(user.photo)
      user.photo
    elsif user.photo.present?
      "users/#{user.photo}"
    else
      "https://bulma.io/images/placeholders/128x128.png" 
    end
  end

  def user_bio(user)
    user.bio.present? ? user.bio : "Say something about yourself ..." 
  end

  def user_location(user)
    user.location.present? ? user.location : "Where do you live?"
  end

  def uri_exists?(url)
    begin
      Net::HTTP.get_response(URI.parse(url)).is_a?(Net::HTTPSuccess)
    rescue
      false
    end
  end

end
