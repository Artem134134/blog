# frozen_string_literal: true

class ContactPolicy < ApplicationPolicy
  def create?
    !user.banned_role? && !user.guest?   
  end

  #
  # rescue StandardError => e
  #
  # end
  #   def index?
  #     true
  #   end
  #
  #   def show?
  #     true
  #   end
  #
  #   def update?
  #     user.admin_role? || user.moderator_role? || user.author?(record)
  #   end
  #
  #   def destroy?
  #     user.admin_role? || user.moderator_role? || user.author?(record)
  #   end
end
