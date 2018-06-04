class UserPolicy < ApplicationPolicy
  def edit?
    user == record
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
