module WikisHelper
  def show_wiki?(wiki)
    if wiki.private == true
      (current_user.has_role? :admin) ? true : false
    else
      true
    end
  end
  
  def permit_collaboration?(wiki, current_user)
     (current_user.has_role? :admin) || ((current_user.has_role? :premium) && (wiki.user == current_user))
  end
end
