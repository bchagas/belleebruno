require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/message'     #Rsvp messages
require './models/rsvp'         #Rsvp class

get '/' do
	erb :index, application_layout
end

def application_layout
  { layout: :"layouts/application" }
end

after do
  # Close the connection after the request is done so that we don't
  # deplete the ActiveRecord connection pool.
  ActiveRecord::Base.connection.close
end
