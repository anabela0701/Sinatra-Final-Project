require 'omdb/api'
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

used_movie_id = []
movie_list = []

# nine character in id
# all start with tt

def find_genre
    moods.each do |mood,genres|
        if @user_mood == mood
            return genres
        end
    end
end

def make_id
	movie_id = []
	movie_id.push("tt")
	if movie_id.length <= 7
		num = rand(9)
		movie_id.push
	else
		movie_id = movie_id.join
		check_used_id(movie_id)
	end
end

def check_used_id(id)
    genres = find_genre
	used_movie_id.each do |i|
		if i == id
		    movie_id
	    else
	        movie = client.find_by_id(id)
	        genres.each do |genre|
	            movie.each do |movie_genre|
	                if genre == movie_genre
	                    movie_list.push(id)
	                end
	            end
	        end
        end
	end
end

# @user_mood = 'happy'

client = Omdb::Api::Client.new(api_key: ENV["MOVIE_API"])

movie = client.find_by_id('tt0083929')

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