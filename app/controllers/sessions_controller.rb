class SessionController < ApplicationController

    get '/sessions/index' do
        erb :'sessions/index'
    end

    get '/sessions/new' do
        erb :'/sessions/new'
    end

    post '/sessions' do
        @new_session = Session.create(duration_minutes: params[:duration_minutes], mood_rating: params[:mood_rating])
        @new_session.user = User.find_by(id: session[:user_id])
        @new_session.save
        redirect "/sessions/#{@new_session.id}"
    end

    get '/sessions/:id' do
        @session = Session.find_by(params[:id])
        erb :'/sessions/show'
    end

end