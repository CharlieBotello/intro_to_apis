
# Exercise: Build a terminal dictionary app
# • Create a new ruby file called dictionary_app.rb

# • The program should ask the user to enter a word, then use the wordnik API to show the word’s definition, top example, and pronunciation: http://developer.wordnik.com/docs.html#!/word
require 'unirest'

system "clear"

# puts "All words brought to you by clueless"
# puts 
puts "please enter a word or q to quit"
input_word = gets.chomp
puts ""

# # response here 

puts ""

if input_word == "q"
  system "clear"
else 
definitions_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

definitions = definitions_response.body
# definition = definition_response.body[0]["text"]
# # p definition[0]["text"]
puts "DEFINITIONS"

puts ""

definitions.each.with_index do |definition, index|
    puts "#{index + 1}. #{definition["text"]}"
    puts
  end

  # this is the simpler version, version above to make it prettier 
# definitions.each. do |definition|
#   puts definition["text"]
#   puts
# end

puts ""

top_example_response = Unirest.get("http://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

top_example = top_example_response.body

puts "TOP EXAMPLE"
puts 
p top_example["text"]

puts ""

pronunciation_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

pronunciations = pronunciation_response.body 


puts "PRONUNCIATION" 

first_pronunciation = pronunciations[0]

  if first_pronunciation
    puts first_pronunciation["raw"]
  else
  end 
end

# system "clear"














