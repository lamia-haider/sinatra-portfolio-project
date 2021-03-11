class SessionController < ApplicationController

    get '/sessions' do
    end

    get '/sessions/new' do
        erb :'/sessions/new'
    end
end