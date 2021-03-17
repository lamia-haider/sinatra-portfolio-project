class SessionController < ApplicationController

    get '/sessions/index' do
        if Helpers.is_logged_in?(session)
            @user = User.find_by(id: session[:user_id])
            erb :'sessions/index'
        else
            flash[:notice] = "You need to log in or sign up to view that page."
            redirect "/"
        end
    end

    post '/sessions/index' do 
        #raise params.inspect
        redirect "/sessions/#{params[:date_select]}"
    end

    get '/sessions/new' do
        if Helpers.is_logged_in?(session)
            erb :'/sessions/new'
        else 
            flash[:notice] = "You need to log in or sign up to view that page."
            redirect "/"
        end
    end


    get '/sessions/:id' do
        if Helpers.is_logged_in?(session) 
            @session = Session.find_by(id: params[:id])
            erb :'/sessions/show'
        else 
            flash[:notice] = "You need to log in or sign up to view that page."
            redirect "/"
        end
    end

    post '/sessions' do
        
        if params[:duration_minutes] =~ /\d/ 
            @new_session = Session.create(duration_minutes: params[:duration_minutes], mood_rating: params[:mood_rating])
            @new_session.user = User.find_by(id: session[:user_id])
            @new_session.save
            redirect "/sessions/#{@new_session.id}"
        else flash[:notice]= "Please enter a numeric value for minutes."
            redirect "/sessions/new"
        end
    end

    get '/sessions/:id/edit' do

        if Helpers.is_logged_in?(session)
            @edit_session = Session.find_by(id: params[:id])
            erb :'/sessions/edit'
        else 
            flash[:notice] = "You need to log in or sign up to view that page."
            redirect "/"
        end
    end

    patch '/sessions/:id/edit' do
        
        @edit_session = Session.find_by(id: params[:id])
        if params[:duration_minutes] != ""
            @edit_session.duration_minutes = params[:duration_minutes]
            @edit_session.mood_rating = params[:mood_rating]
            @edit_session.save
        end
        redirect "/sessions/#{@edit_session.id}"
    end

    delete '/sessions/:id/delete' do
        @delete_session = Session.find_by(id: params[:id])
        @delete_session.delete
        flash[:notice] = "Your session has been deleted."
        redirect '/sessions/index'

    end



end