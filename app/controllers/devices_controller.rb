class DevicesController < ApplicationController

    get '/home' do
        if logged_in? && current_user.id == params[:id]
            @user = User.find(params[:id])
        else
            # message: please login to view your home page
            redirect '/login'
        end
        erb :'devices/home'
    end
    
    get '/appliances/new' do
        @user = current_user
        erb :'appliances/new'
    end


end