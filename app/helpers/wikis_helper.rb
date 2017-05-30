module WikisHelper
  def show_wiki?(wiki)
    if wiki.private == true
      (current_user.has_role? :admin) ? true : false
    else
      true
    end
  end
  
  def permit_collaboration?(current_user)
    (current_user.has_role? :premium) || (current_user.has_role? :admin)
  end
end
