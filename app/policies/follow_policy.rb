class FollowPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    # Can only destroy follows where you are the follower
    record.follower == user
  end
end
