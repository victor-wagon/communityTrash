class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    am_i_the_right_user_or_an_admin?
  end

  def destroy?
    am_i_the_right_user_or_an_admin?
  end

  private

  def am_i_the_right_user_or_an_admin?
    user == record.user || user.admin
  end
end
