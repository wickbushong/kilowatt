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

  get "/about" do
    erb :about
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end

    def daily_consumption(device)
      ((device.power/1000)*device.usage + (device.standby/1000)*(24 - device.usage)).round(3)
    end

    def group_consumption(group)
      group.devices.uniq.collect{|device| daily_consumption(device)}.inject(0, :+).round(3)
    end

    def user_consumption
      current_user.devices.uniq.collect{|device| daily_consumption(device)}.inject(0, :+).round(3)
    end

    def group_exists?(id)
      !!Group.find(id)
    end

    def device_exists?(id)
      !!Device.find(id)
    end
  end
end
