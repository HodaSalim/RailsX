module UsersHelper
  def gravatar_for(user, size: 80)
    if user.present?
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    else
      # Handle the case where user is nil
      image_tag("https://www.gravatar.com/avatar/?d=identicon", alt: "Default Avatar", class: "gravatar")
    end
  end
end
