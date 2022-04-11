class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(role: "User")
    end
  end

  def edit?
    if @user
      @user.role == "Admin"
    end
  end

  def update?
    if @user
      @user.role == "Admin"
    end
  end

  def destroy?
    if @user
      @user.role == "Admin"
    end
  end
end
