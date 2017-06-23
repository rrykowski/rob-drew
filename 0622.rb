# Exercise 1: Create the team class to be able to easily invoke .name and .seed.

class Team
  attr_accessor :name, :seed
  def initialize (name, seed)
    @name = name; @seed = seed
  end
end

# Create a prompt method for reuse later.
def prompt
  print "> "
end

# Counter and container for menu and sorting later.
menu = 0
pool = {}

while menu != 4
  puts "Welcome to My Tournament Generator. Enter a selection:
  1. Enter teams
  2. List teams
  3. List matchups
  4. Exit program"

  prompt
  menu = gets.chomp.to_i

  case menu
  when 1
    puts "Enter a team."
    prompt
    team = gets.chomp.capitalize

    # Validating the range and that there are no duplicates.
    seed = 0
    until (1..20) === seed && pool.has_key?(seed) == false
      puts "Enter an unused seed number between 1 and 20."
      prompt
      seed = gets.chomp.to_i
    end
    team = Team.new(team,seed)
    pool[team.seed] = team.name

  when 2
    puts "Here are all the teams and their seeds:"
    pool.each {|seed, team| puts "#{team}: #{seed}"}

    # The sorting starts by creating a temporary hash that can be destroyed. It prints out the first and last key value pairs based on the pool keys array, then destroys them so that it can run again. Condition check for odd numbers using modulo that plucks out the first item for a bye. When the user invokes case 3 again, the temp hash is repopulated and updated.
  when 3
    pool_temp = pool.clone
    if pool_temp.length % 2 == 1
      puts "(#{pool_temp.keys.min}) #{pool_temp[pool_temp.keys.min]} has a bye"
      pool_temp.delete(pool_temp.keys.min)
    end
    while pool_temp.length > 0
      puts "(#{pool_temp.keys.min}) #{pool_temp[pool_temp.keys.min]} versus (#{pool_temp.keys.max}) #{pool_temp[pool_temp.keys.max]}"
      pool_temp.delete(pool_temp.keys.min)
      pool_temp.delete(pool_temp.keys.max)
    end
  end
end



# Exercise 2 Creating a simple method that decrements an input and validates to pairs of plates only.

def plates(weight)
  total = weight - 45 # the bar
  fortyfives = total / 45
  fortyfives -=1 if fortyfives % 2 == 1
  total -= (fortyfives * 45)
  puts "#{fortyfives} 45lb plates." unless fortyfives == 0

  twentyfives = total / 25
  twentyfives -=1 if twentyfives % 2 == 1
  total -= (twentyfives * 25)
  puts "#{twentyfives} 25lb plates." unless twentyfives == 0

  tens = total / 10
  tens -=1 if tens % 2 == 1
  total -= (tens * 10)
  puts "#{tens} 10lb plates." unless tens == 0

  fives = total / 5
  fives -=1 if fives % 2 == 1
  total -= (fives * 5)
  puts "#{fives} 5lb plates." unless fives == 0

  change = total / 2.5
  change -=1 if change % 2 == 1
  puts "#{change.to_i} 2.5lb plates." unless change == 0
end

weight = 0
until weight != 0 && weight % 5 == 0 && weight > 45
  puts "Welcome to plate calculator. Enter the total weight you want on the bar. Use a multiple of 5 that is greater than 45."
  print "> "
  weight = gets.chomp.to_i
end
puts "Here are the plates you need."
plates(weight)
