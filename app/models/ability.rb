class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [ :read, :create, :my ], Paste
    can [ :update, :destroy ], Paste do |paste|
      paste.try(:user) == user
    end
  end
end
