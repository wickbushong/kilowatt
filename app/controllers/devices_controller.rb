class DevicesController < ApplicationController
    
    get '/devices/new' do
        if !logged_in?
            flash[:error] = "Must be logged in to create devices"
            redirect '/login'
        end
        @options = Option.all
        @groups = current_user.groups
        @user = current_user
        erb :'devices/new'
    end

    post '/devices' do
        if !logged_in?
            flash[:error] = "Must be logged in to create devices"
            redirect '/login'
        end
        
        if params[:custom_name] != "" && params[:name]
            flash[:error] = "Only 1 name input allowed"
            redirect '/devices/new'
        end

        if params[:name]
            option = Option.find_by(name: params[:name])
        end
    
        if !params[:group_name].empty?
            g = Group.create(
                name: params[:group_name],
                user_id: current_user.id
            )
            if params[:group_ids]
                params[:group_ids] << g.id.to_s 
            else
                params[:group_ids] = g.id.to_s 
            end
        end

        d = Device.create(
            name: option ? option[:name] : params[:custom_name],
            power: option ? option[:power] : params[:custom_power],
            standby: option ? option[:standby] : params[:custom_standby],
            usage: params[:usage],
            group_ids: params[:group_ids]
        )
        if d.save
            redirect '/home'
        end
        flash[:error] = d.errors.full_messages
        redirect '/devices/new'
    end

    get '/devices/:id/edit' do
        @device = Device.find(params[:id])
        if @device.users.first != current_user
            flash[:error] = "Device belongs to another user"
            redirect '/home'
        end
        @user = current_user
        erb :'devices/edit'
    end

    patch '/devices/:id' do
        device = Device.find(params[:id])
        if device.users.first != current_user
            flash[:error] = "Device belongs to another user"
            redirect '/home'
        end
      
        if !params[:group_name].empty?
            g = Group.create(
                name: params[:group_name],
                user_id: current_user.id
            )
            if params[:group_ids]
                params[:group_ids] << g.id.to_s 
            else
                params[:group_ids] = g.id.to_s 
            end
        end

        device.update(
            name: params[:name],
            power: params[:power],
            standby: params[:standby],
            usage: params[:usage],
            group_ids: params[:group_ids]
        )
        if device.save
            redirect "/devices/#{device.id}"
        end
        flash[:error] = device.errors.full_messages
        redirect "/devices/#{device.id}/edit"
    end

    delete '/devices/:id' do
        device = Device.find(params[:id])
        if device.users.first != current_user
            flash[:error] = "Device belongs to another user"
            redirect '/home'
        end
        device.destroy
        redirect '/home'
    end

    get '/devices/:id' do
        if params[:id].to_i > Device.last.id
            flash[:error] = "Device not found"
            redirect '/home'
        end
        @device = Device.find(params[:id])
        if @device.users.first != current_user
            flash[:error] = "Device belongs to other user"
            redirect '/home'
        end
        @user = current_user
        erb :'devices/show'
    end


end