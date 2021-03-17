Domain: Meditation tracker with mood ratings per event

Users can:
-Sign up
-Log in and out
-Track date and length of meditation session, assign a mood to the session (optional)
-Only see their own content


Models:
-Users
    - Username
    - Email
    - Password / password_digest 
    - :has_many MeditationSessions

-MeditationSession
    - Duration
    - Date
    - Mood scale
    - :belongs_to Users/ user_id

Stretch Goals
    - Sessions index that shows the year, which when clicked on opens up months, which open up to dates?
    - Tests
    - CSS, soothing pastel theme?
    - Optional - Can select what type of meditation? Radio for guided v unguided, checkboxes for focused attention, body scan, noting, visualization, resting awareness, reflection, other. Ref: https://www.headspace.com/meditation/techniques


    User Auth:
    - User cannot sign up without a valid email, username and pw x
    - If logged in when clicking log in or sign up user gets redirected to index x
    - User redirected to log in if trying to go into sessions without being logged in x 
    - Show, edit and index only come up if logged in, otherwise redirect to welcome x





