class DevicesController < ApplicationController

    get '/home' do
        if logged_in?
            @user = current_user
        else
            # message: please login to view your home page
            redirect '/login'
        end

        @devices = Device.select{|d| d.user == current_user}
        erb :'devices/home'
    end
    
    get '/devices/new' do
        @options = Option.all
        @user = current_user
        erb :'devices/new'
    end

    post '/devices' do
        if params[:custom_name] != "" && params[:name]
            flash[:error] = "Only 1 name input allowed"
            redirect '/devices/new'
        end
        
        if params[:name]
            option = Option.find_by(name: params[:name])
        end

        d = Device.create(
            name: option ? option[:name] : params[:custom_name],
            power: option ? option[:power] : params[:custom_power],
            standby: option ? option[:standby] : 0,
            usage: params[:usage]
        )
        d.user = current_user
        d.save
        redirect '/home'
    end

    get '/devices/:id/edit' do
        @device = Device.find(params[:id])
        if @device.user_id != current_user.id
            redirect '/home'
        end
        @user = current_user
        erb :'devices/edit'
    end

    patch '/devices/:id' do
        @device = Device.find(params[:id])
        @device.update(
            name: params[:name],
            power: params[:power],
            standby: params[:standby],
            usage: params[:usage]
        )
        redirect "/devices/#{@device.id}"
    end

    delete '/devices/:id' do
        @device = Device.find(params[:id])
        @device.destroy
        redirect '/home'
    end

    get '/devices/:id' do
        if params[:id] > Device.last.id
            flash[:error] = "Device not found"
            redirect '/home'
        end
        @device = Device.find(params[:id])
        if @device.user_id != current_user.id
            flash[:error] = "Device belongs to other user"
            redirect '/home'
        end
        @user = current_user
        erb :'devices/show'
    end


end