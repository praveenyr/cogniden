module WikisHelper
  def show_wiki?(wiki)
    if wiki.private == true
      (current_user.has_role? :admin) ? true : false
    else
      true
    end
  end
end
