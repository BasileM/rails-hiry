class HousingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index
    @housings = policy_scope(Housing).order(created_at: :desc)
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
    record.user == user
  end
end
