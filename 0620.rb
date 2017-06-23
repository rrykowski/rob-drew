# Exercise 1

# Create a new hash object.
grades = Hash.new

# Assign range keys to letter grade values.
grades = {90..100 => "A", 80..89 => "B", 70..79 => "C", 60..69 => "D", 0..59 => "F"}

# User input for score converted to integer.
puts "Enter your score."
score = gets.chomp.to_i

# Validation for acceptable integer score ranges.
if score > 100 || score < 0
  puts "Wrong Score"

  # Iterating through the hash and checking to see if the user input is present in a key range defined in the hash. If so, interpolate and print the value of that key to the screen.
else
  grades.each do |x, y|
    if x.include?(score)
      puts "Your grade is #{y}"
    end
  end
end



# Exercise 2

# Get 2 numbers to compare from the user.
puts "Enter a number."
num1 = gets.chomp.to_i
puts "Enter another number"
num2 = gets.chomp.to_i

# Using modulo to evaluate whether the numbers are divisible by one another.
if num1 % num2 == 0
  puts "#{num1} is divisible by #{num2}."
else puts "#{num1} divided by #{num2} leaves #{num1 % num2}."
end



# Exercise 3

# Get user input for a word.
puts "Enter a word to display."
word = gets.chomp

# Turn the word into an array split by each character.
words = word.split("")

# First iterate through the array and printoto avoid new breaks.
puts "Horizontal."
words.each {|x| print "#{x}  "}

# Page escape for new line then iterate using puts for new lines after every letter.
# Pop off the last letter of the word in the array so we can process it differently.
# Print the last letter using string indexing from the original input.
puts "\nNow Vertical."
words.pop
words.each {|x| puts "#{x},"}
puts word[word.length-1]



# Exercise 4

# Get a word to translate into pig latin.
puts "Enter a word to translate."
word = gets.chomp

# Turn the string into an array so that I can move the individual characters around by index later.
words = word.split("")

# Regex to determine of the first character is a vowel or not.
if words[0] =~ /[aeiou]/
  puts "Translation: #{word}way."

  # Pushing to the end of the array the firct item in the array. Rejoin the array to a string and interpolate with the ay ending.
else
  words.push(words.shift)
  puts "Translation: #{words.join}ay."
end



# Exercise 5

# Require the Prima class for the prime? class method. Get the top range for the prime number validation from the user.
require 'prime'
puts "Enter a number to search for primes."
number = gets.chomp.to_i

# Initialize a counter for keeping track of primes.
prime_count = 0

# Iterating over the range using a for loop and incrementing the prime counter using validation from the prime? class method.
for x in 1..number
  if x.prime?
    prime_count +=1
  end
end
puts "There are #{prime_count} prime numbers between 1 and #{number}."



# Exercise 6

# Setting up counters for incrementation.
game_count = 0
player_points = 0
computer_points = 0

# Create an array for the choices that the computer will choose from.
rps = %w[rock paper scissors]

# Store the randomly generated values in an array so they can be referenced without risk of being re-rolled as random.
computer_choices = []

# Loop for a count of 5 using the game_count iterator.
puts "Welcome to Rock Paper Scissors"
while game_count < 5
  puts "Enter rock, paper, or scissors."
  # User input with downcase method to normalize the data. For some reason .downcase! did not work right.
  choice = gets.chomp.downcase

  # Take a random sample once per loop and store it in the choices array.
  computer_choices << rps.sample

  # Conditional matrix with all possible solutions and appropriate incrementation for points accrued. Using game_count as an index marker for the computer choices since it starts at 0 anyway.
  puts "Computer chose #{computer_choices[game_count]}!"
  if computer_choices[game_count] == choice
    puts "It's a tie! Points for both!"
    player_points += 1
    computer_points += 1
    #sleep(2)
  elsif computer_choices[game_count] == "rock" && choice == "paper"
    puts "Player wins!"
    player_points += 1
    #sleep(2)
  elsif computer_choices[game_count] == "paper" && choice == "scissors"
    puts "Player wins!"
    player_points += 1
  elsif computer_choices[game_count] == "scissors" && choice == "rock"
    puts "Player wins!"
    player_points += 1
    #sleep(2)
  elsif computer_choices[game_count] == "rock" && choice == "scissors"
    puts "Computer wins!"
    computer_points += 1
    #sleep(2)
  elsif computer_choices[game_count] == "paper" && choice == "rock"
    puts "Computer wins!"
    computer_points += 1
    #sleep(2)
  elsif computer_choices[game_count] == "scissors" && choice == "paper"
    puts "Computer wins!"
    computer_points += 1
    sleep(2)
  else # Troubleshooting condition
    puts "hmmmm"
    #sleep(2)
  end
  game_count += 1
end

# After the while loop ends add up the accrued points and do some comparisons.
if player_points > computer_points
  puts "Congratulations you won #{player_points} to #{computer_points}"
elsif computer_points > player_points
  puts "The Computer won #{computer_points} to #{player_points}"
else
  puts "It's a tie! You both got #{player_points} games."
end



# Exercise 7

# Generic key entry so you can control when it runs.
puts "Press any key to begin FizzBuzz."
key = gets

# Set the range and iterate through it. Do the && first because the code runs top to bottom and it was getting excluded when it was below the other conditionals that were also applicable.
for x in 1..100
  if (x % 3 == 0) && (x % 5 == 0)
    puts "FizzBuzz"
  elsif x % 3 == 0
    puts "Fizz"
  elsif x % 5 == 0
    puts "Buzz"
  else
    puts x
  end
end



# Exercise 8

# Set up an empty array to hold the values and counters for the menu and averaging total.
arr = []
input = 0
total = 0

# Set the menu to loop until the user enters 4 to exit the program.
while input != 4

  puts "Welcome to score printer. What would you like to do?"
  puts "1. Add a score\n2. Print in ascending order\n3. Print the average\n4. Exit"

  # Getting input from the user as an integer. This gets pushed into the array. Next it increments the running total so we can get the average on demand by dividing by the number of elements in the array. Rounded to the hundreth place so it doesn't get crazy.
  input = gets.chomp.to_i
  case input
  when 1
    puts "Enter a score to add."
    score = gets.chomp.to_i
    arr << score
    total += score
  when 2
    puts arr.sort
  when 3
    puts "#{(total / arr.length.to_f).round(2)}"
  end
end



# Exercise 9

cos_n_caps = {"USA" => "Washington, DC", "Canada"=>"Ottawa", "United Kingdom"=>"London", "France"=>"Paris", "Germany"=>"Berlin", "Egypt"=>"Cairo", "Ghana"=>"Accra", "Kenya"=>"Nairobi", "Somalia"=>"Mogadishu", "Sudan"=>"Khartoum", "Tunisia"=>"Tunis", "Japan"=>"Tokyo", "China"=>"Beijing", "Thailand"=>"Bangkok", "India"=>"New Delhi", "Philippines"=>"Manila", "Australia"=>"Canberra", "Kyrgyzstan"=>"Bishkek"}

# Counters for the menu input, number of questions asked to store them in an array, number of questions asked, and the running score tally.
input = 0
questions_asked = []
qnum = 0
score = 0

while input != 2
  puts "Welcome to the country quiz. What do you want to do?"
  puts "1. Give me a question!\n2. Exit and tally my score."
  input = gets.chomp.to_i
  case input

# Getting a random question and then putting it into an array to reference it in the scoring validation. FUture version would have a mechanism to detect duplicates...
  when 1
    questions_asked << cos_n_caps.keys.sample
    puts "What is the capital of #{questions_asked[qnum]}?"
    answer = gets.chomp.capitalize
    if answer == cos_n_caps[questions_asked[qnum]]
      puts "Well done!"
      score +=1
    else
      puts "Nope!"
    end
    qnum +=1
  end
end

puts "Okay looks like you scored #{score} out of #{qnum}. #{(score / qnum.to_f).round(2) * 100} percent!"
