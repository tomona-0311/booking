class ReservationsController < ApplicationController
  def index
  end
  def  new
     @user= current_user

     @room=Room.find(params[:room_id])
     binding.pry
     @reservation = Reservation.new

    end

end
