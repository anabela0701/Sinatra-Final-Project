require 'paralleldots'
# I had to put 'gem install paralleldots' into the terminal,
# so can everyone access the gem? What about when we deploy the app?
# Is is only running locally?

moods = {
    "happy" => ["Comedy", "Adventure", "Action"],
    "sad" => ["Drama", "Romantic Comedy"],
    "angry" => ["Thriller", "Mystery", "Horror"],
    "excited" => ["Animation", "Kids", "Comedy"],
    "fear" => ["Horror", "Comedy"],
    "bored" => ["Comedy", "Action", "Thriller"]
}

set_api_key(ENV["PARALLEL_API"])
# get_api_key

def get_mood(mood)
    @user_mood=emotion(mood)
    @user_mood["emotion"]["emotion"]
end
# puts get_mood("happy")

def genres(moods_hash)
    moods_hash.each do |mood,moods|
        if mood == @user_mood.downcase
            return moods
        end
    end
end
# @user_mood = "happy"
# puts genres(moods)