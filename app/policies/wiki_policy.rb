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

  def show?
    user.present?
  end


  class Scope < Scope
    def resolve
      if user.has_role?(:admin)
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

end
