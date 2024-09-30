# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.banned_role? && !user.guest?  
  end

  def update?
    (user.admin_role? || user.moderator_role? || user.author?(record)) && !user.banned_role?
  end

  def destroy?
    (user.admin_role? || user.moderator_role? || user.author?(record)) && !user.banned_role?
  end
end
