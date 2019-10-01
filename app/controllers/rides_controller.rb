class RidesController < ApplicationController
  def create
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect to user_path(ride.user), flash: {message: message}
end
