class InventoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def show
    record.user == user
  end

  def index
    record.housing.user == user
  end
end

