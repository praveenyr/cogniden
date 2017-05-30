class WikiPolicy < ApplicationPolicy

  def update?
    (user.has_role?(:admin) || record.user ==  user) || record.collaborators.include?(Collaborator.find_by_user_id(user.id))
  end

  def destroy?
    user.has_role?(:admin) || record.user ==  user
  end

  def edit?
    (user.has_role?(:admin) || record.user ==  user) || record.collaborators.include?(Collaborator.find_by_user_id(user.id))
  end
  
  def create?
    user.present?
  end

  def show?
    user.present?
  end


  class Scope < Scope
    
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      wikis = []
      if user.has_role?(:admin)
        wikis = scope.all
      else 
       all_wikis = scope.all
         all_wikis.each do |wiki|
          if (wiki.user == user || wiki.collaborators.include?(Collaborator.find_by_user_id(user.id)))
              wikis << wiki
          end
         end
         wikis
      end
    end
  end
end
