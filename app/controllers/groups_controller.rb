class GroupsController < ApplicationController
    
    get '/groups' do
        if !logged_in?
            flash[:error] = "Must be logged in to view groups"
            redirect '/login'
        end
        erb :'groups/index'
    end

    get '/groups/new' do
        if !logged_in?
            flash[:error] = "Must be logged in to create groups"
            redirect '/login'
        end
        erb :'groups/new'
    end

    post '/groups' do
        g = Group.create(
            name: params[:name],
            device_ids: params[:device_ids]
        )
        if g.save
            redirect '/home'
        end
        flash[:error] = g.errors.full_messages
        redirect '/devices/new'
    end
    
    get '/groups/:id' do
        @group = Group.find(params[:id])
        if !logged_in?
            flash[:error] = "Must be logged in to view groups"
            redirect '/login'
        elsif !current_user.groups.include?(@group)
            flash[:error] = "That group belongs to another user"
            redirect '/groups'
        end
        erb :'groups/show'
    end

end