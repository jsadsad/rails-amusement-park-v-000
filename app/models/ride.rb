class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  end

  def user_meets_requirements
  end

  
end
