require "sinatra/base"
require "sinatra/reloader"
require "./lib/room"
require "./lib/user"

class MakersBnB < Sinatra::Base
  enable :sessions
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end

  get "/" do
    erb (:index)
  end

  get "/about" do
    erb (:about)
  end

  get "/users/new" do
    erb (:"users/new")
  end

  post "/users" do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
    )
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect("/")
  end

  get "/sessions/new" do
    erb (:"sessions/new")
  end

  post "/sessions" do
    if (user = User.authenticate(
      email: params[:email],
      password: params[:password],
    ))
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect to("/")
    else
      redirect to("/sessions/new")
    end
  end

  get "/rooms" do
    if session[:user_id]
      @rooms = Room.all
      erb (:"rooms/index")
    else
      redirect to("/sessions/new")
    end
  end

  get "/rooms/new" do
    erb (:"rooms/new")
  end

  post "/rooms/add" do
    Room.add(
      name: params[:name],
      description: params[:description],
      rate: params[:rate],
      available_from: params[:start_date],
      available_to: params[:end_date]
      )
    redirect "/rooms"
  end

  get "/rooms/:id" do
    @room = Room.find(id: params[:id])
    erb(:"rooms/room")
  end

  get "/images/:file" do
    # :nocov:
    send_file File.join(File.dirname(__FILE__), "public/images/#{params[:file]}")
    # :nocov:
  end

  get "/search" do
    @search = params[:search]
    @rooms = Room.search(params[:search])
    erb(:"rooms/search")
  end

  run! if app_file == $0
end
