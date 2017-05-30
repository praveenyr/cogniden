class WikiPolicy < ApplicationPolicy

  def update?
    user.has_role?(:admin) || record.user ==  user
  end

  def destroy?
    user.has_role?(:admin) || record.user ==  user
  end

  def edit?
    user.has_role?(:admin) || record.user ==  user
  end
  
  def create?
    user.present?
  end

  def show?
    user.present?
  end


  class Scope < Scope
    def resolve
      wikis = []
      if user.has_role?(:admin)
        wikis = scope.all
      else 
       all_wikis = scope.all
         all_wikis.each do |wiki|
          if (wiki.user == user || wiki.collaborators.include?(user))
              wikis << wiki
          end
         end
         wikis
      end
    end
  end
end
