class RsvpsController < ApplicationController

 def new
   @status_options = Rsvp::STATUSES.map { |s| [s.last, s.first] }
   @guests_options = Rsvp::GUESTS.map { |s| [s.last, s.first] }

   @rsvp = Rsvp.new
 end
end
