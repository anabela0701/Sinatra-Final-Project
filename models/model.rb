require 'omdb/api'

moods = {
    :happy => ["Comedy", "Adventure", "Action"],
    :sad => ["Drama", "Romantic Comedy"],
    :angry => ["Thriller", "Mystery", "Horror"],
    :love => ["Romance, Romantic Comedy"],
    :fear => ["Horror"]
}

used_movie_id = []
movie_list = []

#nine character in id
#all start with tt

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

@user_mood = 'happy'