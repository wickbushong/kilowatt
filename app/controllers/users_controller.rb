class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        if User.find_by(username: params[:username])
            # message: username taken
            redirect '/signup'
        elsif params[:username] == "" || params[:email] == "" || params[:password] == ""
            # message: must fill out all fields
            redirect '/signup'
        end
        @user = User.create(params)
        session[:user_id] = @user.id
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
            # message: invalid username or pass
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/'
        else
            redirect to '/'
        end
    end

end