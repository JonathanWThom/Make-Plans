module ApplicationHelper
  def identify_user(email)
    if User.exists?(email: email)
      user = User.find_by email: email
      user.full_name
    else
      email
    end
  end
end
