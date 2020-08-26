class GroupsController < ApplicationController
    
    get '/groups' do
        if !logged_in?
            flash[:error] = "Must be logged in to view groups"
            redirect '/login'
        end
        erb :'groups/index'
    end

    get '/groups/:id' do
        @group = Group.find(params[:id])
        if !logged_in?
            flash[:error] = "Must be logged in to view groups"
            redirect '/login'
        elsif !current_groups.include?(@group)
            flash[:error] = "That group belongs to another user"
            redirect '/groups'
        end
        erb :'groups/show'
    end

end