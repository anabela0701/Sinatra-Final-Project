require 'paralleldots'
require 'dotenv/load'
require 'json'
require 'open-uri'

moods = {
    "happy" => ["Comedy", "Adventure", "Action"],
    "sad" => ["Drama", "Romantic Comedy"],
    "angry" => ["Thriller", "Mystery", "Horror"],
    "excited" => ["Animation", "Kids", "Comedy"],
    "fear" => ["Horror", "Comedy"],
    "bored" => ["Comedy", "Action", "Thriller"]
}

id = 'tt2294629'
json = JSON.parse(open("http://www.omdbapi.com/?i=" + id + "&apikey=d3d6e011"){ |x| x.read })

def find_genre
    $moods.each do |mood,genres|
        if @user_mood == mood
            return genres
        end
    end
end

puts json

json.each do |x,i|
    puts i
end

set_api_key(ENV["PARALLEL_API"])

def get_mood(mood)
    @user_mood=emotion(mood)
    @user_mood = @user_mood["emotion"]["emotion"]
end

def genres(moods_hash)
    moods_hash.each do |mood,moods|
        if mood == @user_mood.downcase
            @movie_list = moods
        end
    end
end

