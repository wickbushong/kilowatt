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
    
    get '/appliances/new' do
        @user = current_user
        erb :'appliances/new'
    end


end