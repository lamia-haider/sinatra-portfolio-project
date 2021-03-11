class SessionController < ApplicationController

    get '/sessions/index' do
        erb :'sessions/index'
    end

    post '/sessions/index' do 
        #raise params.inspect
        redirect "/sessions/#{params[:date_select]}"
    end

    get '/sessions/new' do
        erb :'/sessions/new'
    end


    get '/sessions/:id' do
        @session = Session.find_by(id: params[:id])
       
        erb :'/sessions/show'
    end

    post '/sessions' do
        @new_session = Session.create(duration_minutes: params[:duration_minutes], mood_rating: params[:mood_rating])
        @new_session.user = User.find_by(id: session[:user_id])
        @new_session.save
        redirect "/sessions/#{@new_session.id}"
    end

    get '/sessions/:id/edit' do
        
        @edit_session = Session.find_by(id: params[:id])
        erb :'/sessions/edit'
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