class SessionController < ApplicationController

    get '/sessions/index' do
        erb :'sessions/index'
    end

    get '/sessions/new' do
        erb :'/sessions/new'
    end

    get '/sessions/:id' do
        @session = Session.find_by(params[:id])
        erb :'/sessions/show'

    end
end