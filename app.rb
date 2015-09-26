require "sinatra"
require "sinatra/content_for"
require "sinatra/activerecord"
require "sinatra/static_assets"
require "sass"
require "./config/environments"     #database configuration
require "./helpers/application"     #view helpers
require "./models/music_sugestion"  #music Sugestion class
require "./models/rsvp"             #rsvp class

configure do
  set :root, File.dirname(__FILE__)
  set :sass, { :style => :expanded, :debug_info => true }
end

get '/css/:name.css' do |name|
  content_type :css
  sass "stylesheets/#{name}".to_sym, :layout => false
end

get "/" do
	erb :index, application_layout
end

get '/images/:file' do
  send_file("images/"+params[:file])
end

get '/javascripts/:file' do
  send_file("javascripts/"+params[:file])
end

get "/confirmacao-de-presenca" do
  erb :confirmation, application_layout
end

get "/cerimonia-e-festa" do
  erb :ceremony_and_party, application_layout
end

get "/indique-uma-musica" do
  erb :music_sugestion, application_layout
end

get "/informacoes" do
  erb :informations, application_layout
end

get "/lista-de-presentes" do
  erb :gift_list, application_layout
end

get "/fotos" do
  erb :photos, application_layout
end

#post routes
post "/confirm" do
  rsvp = Rsvp.new(params)
  if rsvp.save
    erb :music_sugestion, application_layout
  else
    erb :confirmation, application_layout
  end
end

post "/indicate" do
  music_sugestion = MusicSugestion.new(params)
  if music_sugestion.save
    {:message => "Obrigado! Aguardamos você para a nossa festa"}.to_json
  else
    erb :music_sugestion, application_layout
  end
end

after do
  # Close the connection after the request is done so that we don"t
  # deplete the ActiveRecord connection pool.
  ActiveRecord::Base.connection.close
end
