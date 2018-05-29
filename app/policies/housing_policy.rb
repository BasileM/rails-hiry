class HousingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
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
      record.user == user
    end
end
