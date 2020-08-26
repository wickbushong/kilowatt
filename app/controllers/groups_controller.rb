class GroupsController < ApplicationController
    
    get '/groups' do
        binding.pry
        if !logged_in?
            flash[:error] = "Must be logged in to view groups"
            redirect '/login'
        end
        erb :'groups/index'
    end

    get '/groups/:id' do
        
    end

end