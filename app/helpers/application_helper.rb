module ApplicationHelper
  def identify_user(email)
    if User.exists?(email: email)
      user = User.find_by email: email
      user.full_name
    else
      email
    end
  end

  def activities_select
    current_user.activities.map { |a| [a.title, a.id] }
  end

  def formatted_date(date)
    date.strftime("%B %e, %Y at %l:%M %P")
  end
end
