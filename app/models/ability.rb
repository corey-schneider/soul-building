# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # note regular users cannot create accounts, this acts as an admin
    return unless user.present?

    can :manage, Ticket
  end
end
