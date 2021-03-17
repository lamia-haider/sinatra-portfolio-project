require './config/environment'
require 'rack-flash'

class UsersController < ApplicationController

    use Rack::Flash

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password:params[:password])
        if @user.username.empty? || @user.email.empty? || !@user.save
            flash[:notice] = "User creation unsuccessful, please try again."
            redirect '/signup'
        else @user.save
            session[:user_id] = @user.id
            redirect "/sessions/index"
        end
    
        
    end


    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        user= User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/sessions/index"
        end

    end

    get '/logout' do
        if session[:user_id] == nil
          redirect "/"
        else
          session.clear
          redirect '/'
        end
    end
    




end
