# Exercise 1: Creating a method that takes 3 inputs. 2 integers and 1 string for the type of arithmetic.

def calc(num1, num2, x)
  case x
  when "add"
    puts num1 + num2
  when "subtract"
    puts num1 - num2
  when "multiply"
    puts num1 * num2
  when "divide"
    puts num1 / num2
  else
    puts "You didn't give a valid type of arithmetic."
  end
end

# Simple input engine to get the parameters for the method.
puts "Welcome to calculator. Enter a number."
num1 = gets.chomp.to_i
puts "Enter a second number"
num2 = gets.chomp.to_i
puts "Do you want to add, subtract, multiply, or divide?"
type = gets.chomp

# Using print to get the method call in-line.
print "Result: "
calc(num1, num2, type)



# Exercise 2: Asking for 2 integers, doing some data validation, and returning the remainder.

# Set up the variables so that the validation loop starts.
num1 = 0
num2 = 0

# The method validates whether there is a remainder and displays it if so.
def remain(x,y)
  divide = x / y
  remainder = x % y
  if divide == 0
    puts "The first number is smaller than the second, therefore there is no remainder."
  elsif divide > 0
    puts "These numbers divide #{divide} times with a remainder of #{remainder}."
  end
end

# Input validation for the variables. Since non-integers evaluate to 0 with .to_i I just check to see if the inputs are greater than 0, which also prevents zeros from being used.
until num1 > 0
  puts "Please enter an integer greater than 0."
  num1 = gets.chomp.to_i
end
until num2 > 0
  puts "Please enter another integer greater than 0."
  num2 = gets.chomp.to_i
end

remain(num1,num2)

# Exercise 3: Bulding a quiz using an editable hash.

quiz = {}
counter = 1
score = 0

puts "Welcome to QUIZ program! How many questions will you have?"
number = gets.chomp.to_i

# Getting the inputs from the user using a loop.
number.times do
  puts "Please enter question number #{counter}."
  question = gets.chomp
  puts "Please enter the answer."
  answer = gets.chomp
  quiz[question] = answer
  puts "All set with question #{counter}."
  counter +=1
end

puts "Press any key to start the quiz."
gets

system("clear")

# Iterating over the hash and matching up key-value pairings.
quiz.each do |question, answer|
  puts "#{question}"
  ans = gets.chomp
  if ans == answer
    puts 'Yes! You got it!'
    score += 1
  else
    puts "Nope, the answer was #{answer}."
  end
end

puts "All right it looks like you got #{score} out of #{number} questions right."
