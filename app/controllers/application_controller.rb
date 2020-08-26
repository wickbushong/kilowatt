require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect '/home'
    end
    erb :welcome
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end

    def current_groups
      Group.all.select do |group|
        !!group.devices.find {|device|device.user == current_user}
      end
    end
  end
end
