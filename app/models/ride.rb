class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user_has_enough_tickets, user_is_tall_enough = user_meets_requirements
    if user_has_enough_tickets && user_is_tall_enough
      start_ride
    elsif user_is_tall_enough && !user_has_enough_tickets
      "Sorry! " + not_enough_tickets
    elsif !user_is_tall_enough && user_has_enough_tickets
      "Sorry! " + not_tall_enough
    elsif !user_is_tall_enough && !user_has_enough_tickets
      "Sorry! " + not_tall_enough + " " + not_enough_tickets
    end 
  end

  def user_meets_requirements
    user_has_enough_tickets, user_is_tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      user_has_enough_tickets = true
    end
    if self.user.height >= self_attraction.min_height
      user_is_tall_enough = true
    end
    return [user_has_enough_tickets, user_is_tall_enough]
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
