class SessionController < ApplicationController

    get '/sessions/index' do
        erb :'sessions/index'
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
        raise params.inspect
       # redirect "/sessions/#{@new_session.id}"
    end

    get '/sessions/:id/edit' do
        
        @edit_session = Session.find_by(params[:id])
        erb :'/sessions/edit'
    end

    patch '/sessions/:id/edit' do
        
        @edit_session = Session.find_by(params[:id])
        if params[:duration_minutes] != ""
            @edit_session.duration_minutes = params[:duration_minutes]
            @edit_session.mood_rating = params[:mood_rating]
            @edit_session.save
        end
        redirect "/sessions/#{@edit_session.id}"
    end

end