require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    enable :sessions
    set :session_secret, "my_application_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
