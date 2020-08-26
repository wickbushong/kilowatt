class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(params)
        
        if user.invalid?
            flash[:error] =  user.errors.full_messages
            redirect '/signup'
        end
        session[:user_id] = user.id
        redirect "/home"
    end

    get '/login' do
        if logged_in?
            redirect "/home"
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/home"
        else
            flash[:error] = "Invalid username and password combination"
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
        end
        redirect '/'
    end

    get '/home' do
        if logged_in?
            @user = current_user
        else
            flash[:error] = "Please login in to view your homepage"
            redirect '/login'
        end

        @devices = Device.select{|d| d.user == current_user}
        erb :'devices/home'
    end

end