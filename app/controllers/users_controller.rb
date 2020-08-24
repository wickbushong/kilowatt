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
        redirect "/users/#{@user.id}"
    end

    get '/login' do
        if logged_in?
            redirect "/users/#{current_user.id}"
        end
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
 
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            # message: invalid username or pass
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
          else
            redirect to '/'
          end
    end

    get '/users/:id' do
        if logged_in? && current_user.id == params[:id]
            @user = User.find(params[:id])
        else
            # message: please login to view your home page
            redirect '/login'
        end
        erb :'users/home'
    end


end