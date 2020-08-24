class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(params)
        if user.invalid?
            # message: 
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
            # message: invalid username or pass
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
        end
        redirect '/'
    end

end