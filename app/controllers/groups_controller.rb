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
        if !logged_in?
            flash[:error] = "Must be logged in to create groups"
            redirect '/login'
        end
        g = Group.create(
            name: params[:name],
            device_ids: params[:device_ids],
            user_id: current_user.id
        )
        if g.save
            redirect '/home'
        end
        flash[:error] = g.errors.full_messages
        redirect '/devices/new'
    end
    
    get '/groups/:id/edit' do
        if !group_exists?(params[:id])
            flash[:error] = "Group doesn't exist"
            redirect '/home'
        end
        
        @group = Group.find(params[:id])
        if !logged_in?
            flash[:error] = "Must be logged in to edit groups"
            redirect '/login'
        elsif @group.user != current_user
            flash[:error] = "That group belongs to another user"
            redirect '/groups'
        end
        erb :'groups/edit'
    end

    patch '/groups/:id' do
        if !logged_in?
            flash[:error] = "Must be logged in to edit groups"
            redirect '/login'
        elsif @group.user != current_user
            flash[:error] = "That group belongs to another user"
            redirect '/groups'
        end
        group = Group.find(params[:id])
        group.update(
            name: params[:name],
            device_ids: params[:device_ids]
        )
        redirect "/groups/#{group.id}"
    end

    delete '/groups/:id' do
        group = Group.find(params[:id])
        if !logged_in?
            flash[:error] = "Must be logged in to delete groups"
            redirect '/login'
        elsif group.user != current_user
            flash[:error] = "This group belongs to another user"
            redirect '/home'
        end
        group.destroy
        redirect '/home'
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