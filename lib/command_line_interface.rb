def welcome
  puts "Welcome to the Star Wars character directory! We can tell you all films any character appears in."
end

def get_character_from_user
  puts "please enter a character"
  gets.chomp.downcase
end
