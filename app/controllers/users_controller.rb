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
        else user.save
            session[:user_id] = user.id
        end
    
        
    end


    get '/login' do
        
    end


end
