class UserController < ApplicationController
    
    get '/sign_up' do
        erb :'user/sign_up'
    end


     post '/sign_up' do
        user = User.new(params)
        begin 
            user.save!
            session[:user_id] = user.id
            redirect '/login'
        rescue StandardError => e
            puts "Exception raised #{e}"
            erb :error
          end
     end 

    get '/login' do
        erb :'user/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        valid_password = @user.authenticate(params[:password])
        if @user && valid_password
            @password = (params[:password])
        else
          erb :error 
        end
        if @user && @password
            session[:user_id] = @user.id
            redirect '/activities'
        else 
            erb :error
        end 
    end 


    get '/logout' do
        session.clear
        redirect '/'
    end



end 