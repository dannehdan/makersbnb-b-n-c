require "sinatra/base"
require "sinatra/reloader"
require "./lib/room"
require './lib/user'

class MakersBnB < Sinatra::Base
  enable :sessions
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
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name]
    )
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect('/')
  end

  get '/sessions/new' do
    erb (:"sessions/new")
  end

  post '/sessions' do
    if user = User.authenticate(
      email: params[:email],
      password: params[:password]
    )
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect to('/')
    else
      redirect to('/sessions/new')
    end
  end

  get '/about' do
    erb (:about)
  end

  get '/rooms' do
    if session[:user_id]
      @rooms = Room.all
      erb (:"rooms/index")
    else
      redirect to('/sessions/new')
    end
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
