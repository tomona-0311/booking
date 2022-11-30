class ReservationsController < ApplicationController
  def index
  end
  def  new
     @user= current_user
     @room=Room.find(params[:id])
     @reservation = Reservation.new

    end

end
