class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index
  #   @rooms = policy_scope(Room).order(created_at: :desc)
  # end

  def create?
    return true
  end

  def update?
    record.housing.user == user
  end
end
