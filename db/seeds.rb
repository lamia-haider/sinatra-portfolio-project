

ab = User.create(username:"annabanana", email:"annab@aol.com", password:"password")

bb = User.create(username:"billybob", email:"bbob@aol.com", password:"password1")

Session.create(duration_minutes:"15", mood_rating:"2", user_id:ab.id)


ab.sessions.create(duration_minutes:"9", mood_rating:"4")