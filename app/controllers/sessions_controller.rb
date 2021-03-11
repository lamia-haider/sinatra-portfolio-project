class SessionController < ApplicationController

    get '/sessions/index' do
        erb :'sessions/index'
    end

    get '/sessions/new' do
        erb :'/sessions/new'
    end
end