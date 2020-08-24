class DevicesController < ApplicationController

    get '/home' do
        if logged_in?
            @user = current_user
        else
            # message: please login to view your home page
            redirect '/login'
        end
        erb :'devices/home'
    end
    
    get '/devices/new' do
        @options = Option.all
        @user = current_user
        erb :'devices/new'
    end

    post '/devices/new' do
        if params[:custom_name] != "" && params[:name]
            flash[:error] = "Only 1 name input allowed"
            redirect '/devices/new'
        end
        
        user = current_user
        Device.create(
            name: ,
            power: ,
            standby: ,
            usage: 
        )
    end


end