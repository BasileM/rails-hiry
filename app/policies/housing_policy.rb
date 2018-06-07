class HousingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: user.id).order(created_at: :desc)
    end
  end

  def index?
    record.user == user
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
end
