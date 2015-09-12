require "sinatra"
require "sinatra/activerecord"
require "sinatra/static_assets"
require "./config/environments"     #database configuration
require "./helpers/application"     #view helpers
require "./models/music_sugestion"  #music Sugestion class
require "./models/rsvp"             #rsvp class

get "/" do
	erb :index, application_layout
end

get "/sobre" do
  erb :about, application_layout
end

get "/confirmacao-de-presenca" do
  erb :confirmation, application_layout
end

get "/cerimonia-e-festa" do
  erb :ceremony_and_party, application_layout
end

#post routes
post "/confirm" do
  rsvp = Rsvp.new(params)
  if rsvp.save
    erb :confirmation, application_layout
  else
    flash[:error] = parse_errors(rsvp.errors.messages)
    erb :confirmation, application_layout
  end
end

after do
  # Close the connection after the request is done so that we don"t
  # deplete the ActiveRecord connection pool.
  ActiveRecord::Base.connection.close
end
