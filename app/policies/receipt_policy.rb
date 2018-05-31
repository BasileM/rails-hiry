class ReceiptPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def index?
    return true
  end

  def update?
    record.housing.user == user
  end
end
