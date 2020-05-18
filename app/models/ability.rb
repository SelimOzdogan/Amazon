class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.isadmin?
      can :manage, :all
    end

    can :destroy, Product do |product|
      product.user == user
    end
    can :update, Product do |product|
      product.user == user
    end
    can :review, Product do |product|
      product.user != user
    end

    can :hit, Product do |product|
      product.user != user
    end
    can :favorite, Product do |product|
      product.user != user
    end
    can :destroy, Favorite do |favorite|
      favorite.user == user
    end

    can :like, Review do |review|
      review.user != user
    end
    can :destroy, Review do |review|
      review.user == user
    end

    can :destroy, Like do |like|
      like.user == user
    end
  end
end
