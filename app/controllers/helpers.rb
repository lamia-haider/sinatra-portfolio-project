class Helpers < ApplicationController


    def self.is_logged_in?(session)
        !!session[:user_id]
    end
        


end