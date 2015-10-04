class RsvpsController < ApplicationController

 def new
   @status_options = Rsvp::STATUSES.map { |s| [s.last, s.first] }

   @rsvp = Rsvp.new
 end

 def create
   @rsvp = Rsvp.new(rsvp_params)

   if @rsvp.save
     redirect_to music_path
   else
     @status_options = Rsvp::STATUSES.map { |s| [s.last, s.first] }

     render :new
   end
 end

 private

 def rsvp_params
   params.require(:rsvp).permit(:name, :email, :status, :guest, guest_name: [])
 end
end
