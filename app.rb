require "sinatra/base"
require "sinatra/reloader"
require "./lib/room"

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb (:index)
  end

  get '/users/new' do
    erb (:"users/new")
  end

  post '/users' do
    User.create(
      email: params[:email],
      password: params[:password]
    )
    redirect('/')
  end

  get '/about' do
    erb (:about)
  end

  get '/rooms' do
    @rooms = Room.all
    erb (:"rooms/index")
  end

  get '/rooms/:id' do
    @room = Room.find(id: params[:id])
    erb(:"rooms/room")
  end

  get '/boat-icon.svg' do
    send_file File.join(File.dirname(__FILE__), "public/images/boat-icon.svg")
  end

  get '/search' do
    @search = params[:search]
    @rooms = Room.search(params[:search])
    erb(:"rooms/search")
  end
  
  run! if app_file == $0
end
