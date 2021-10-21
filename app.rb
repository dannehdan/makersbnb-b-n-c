require "sinatra/base"
require "sinatra/reloader"
require "./lib/room"

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb (:index)
  end

  get "/about" do
    erb (:about)
  end

  get "/rooms" do
    @rooms = Room.all
    erb (:"rooms/index")
  end

  get "/rooms/new" do
    erb (:"rooms/new")
  end

  post "/rooms" do
    Room.add(name: params[:name], description: params[:description], rate: params[:rate])
    redirect "/rooms"
  end

  get "/rooms/:id" do
    @room = Room.find(id: params[:id])
    erb(:"rooms/room")
  end

  get "/boat-icon.svg" do
    send_file File.join(File.dirname(__FILE__), "public/images/boat-icon.svg")
  end

  get "/search" do
    @search = params[:search]
    @rooms = Room.search(params[:search])
    erb(:"rooms/search")
  end

  run! if app_file == $0
end
