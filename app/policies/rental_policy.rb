class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true
  end

  def update?
    record.housing.user == user
  end

  def signing?
    record.housing.user == user
  end

  def docusign_response?
    record.housing.user == user
  end
end
