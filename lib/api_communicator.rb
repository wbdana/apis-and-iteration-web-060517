require 'rest-client'
require 'json'
require 'pry'


## Adding pages from API to #character_hash
#  1. all_characters = RestClient.get('http://swapi.co/api/people')
#  2. character_hash = JSON.parse(all_characters)
#  3. if character_hash["next"].include?("page=")
#       all_characters << RestClient.get('http://swapi.co/api/people/?page=INCREMENTAL VARIABLE COUNTER')
#       character_hash = JSON.parse(all_characters)



def character_hash
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  # count = 2
  #
  # if character_hash["next"].include?("page=")
  #   all_characters << RestClient.get(character_hash["next"])
  #   character_hash = JSON.parse(all_characters)
  #   count += 1
  # end
end

def get_film_urls(character)
  character_hash["results"].find{|character_data| character_data["name"].downcase == character}["films"]
end

def get_character_movies_from_api(character)
  get_film_urls(character).map {|url| JSON.parse(RestClient.get(url))}
end

def parse_character_movies(films_hash)
  films_hash.each_with_index{|film, index| puts "#{index + 1} #{film["title"]}"}
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
