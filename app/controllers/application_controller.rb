require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to "/account"
    else 
      erb :failure
    end 
  end

  get '/account' do
    @current_user = User.find_by(id: session[:user_id])
    if @current_user
      erb :account
    else 
      erb :failure
    end 
    
  end

  get '/failure' do
    erb :failure
  end 
  
  get '/logout' do
    redirect to '/' 
  end

end

