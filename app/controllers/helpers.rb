class Helpers < ApplicationController


    def self.is_logged_in?(session)
        !!session[:user_id]
    end
        
    def self.current_user(user)
        @user= User.find(id: user[:user_id])
    end

    def self.moodimage(session)
        if session.mood_rating == 1
             '/images/awful.jpg'
        elsif session.mood_rating == 2
            image '/images/not_great.jpg'
        end

    end

end