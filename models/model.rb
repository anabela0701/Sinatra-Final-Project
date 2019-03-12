require 'paralleldots'
require 'dotenv/load'
require 'pp'

# require 'paralleldots'
# I had to put 'gem install paralleldots' into the terminal,
# so can everyone access the gem? What about when we deploy the app?
# Is is only running locally?

$moods = {
    "happy" => ["Comedy", "Adventure", "Action"],
    "sad" => ["Drama", "Romantic Comedy"],
    "angry" => ["Thriller", "Mystery", "Horror"],
    "excited" => ["Animation", "Kids", "Comedy"],
    "fear" => ["Horror", "Comedy"],
    "bored" => ["Comedy", "Action", "Thriller"]
}
# @user_mood = 'happy'

require 'json'
require 'open-uri'

id = 'tt2294629'
json = JSON.parse(open("http://www.omdbapi.com/?i=" + id + "&apikey=d3d6e011"){ |x| x.read })

puts json

json.each do |x,i|
    puts i
end

# puts movie
# pp client.search(genre = 'comedy').inspect.split('#')
# puts movie.class
# puts "hi".class

set_api_key(ENV["PARALLEL_API"])
get_api_key

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

@user_mood = "sad"
puts genres(moods)
