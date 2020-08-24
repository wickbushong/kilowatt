class AppliancesController < ApplicationController

    get '/appliances/new' do
        @user = current_user
        erb :'appliances/new'
    end

end