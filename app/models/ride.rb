class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  end

  def user_meets_requirements
  end

  def start_ride
  end

  def not_enough_tickets
    "You do not have enough tickets to ride #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride #{self.attraction.name}."
  end
end
