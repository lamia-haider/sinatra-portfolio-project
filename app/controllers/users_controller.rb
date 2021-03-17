require './config/environment'
require 'rack-flash'

class UsersController < ApplicationController

    use Rack::Flash

    get '/signup' do
        if session[:user_id] == nil
        erb :'/users/signup'
        else
            redirect '/sessions/index'
        end
    end

    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password:params[:password])
        if @user.username.empty? || @user.email.empty? || !@user.save
            flash[:notice] = "User creation unsuccessful, please try again."
            redirect '/signup'
        elsif !@user.email.include?("@")
            flash[:notice]= "Please enter a valid email address."
            redirect '/signup'
        else @user.save
            session[:user_id] = @user.id
            redirect "/sessions/index"
        end
    
        
    end


    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect "/sessions/index"
        else
            erb :'/users/login'
        end
    end

    post '/login' do
        user= User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/sessions/index"
        else
            flash[:notice] = "Login unsuccessful. Please enter your username and password again."
            redirect "/login"
        end

    end

    get '/logout' do
        if session[:user_id] == nil
          redirect "/"
        else
          session.clear
          redirect "/"
        end
    end
    




end
