
CHOICES = %w(rock paper scissors lizard spock)

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

def display_outcome(first, second)
  if first == 'rock' && second == 'scissors'
    prompt "Rock breaks scissors."
  elsif first == 'rock' && second == 'lizard'
    prompt "Rock crushes lizard."
  elsif first == 'paper' && second == 'rock'
    prompt "Paper covers rock."
  elsif first == 'paper' && second == 'spock'
    prompt "Paper disproves Spock."
  elsif first == 'scissors' && second == 'paper'
    prompt "Scissors cut paper."
  elsif first == 'scissors' && second == 'lizard'
    prompt "Scissors decapitate lizard."
  elsif first == 'lizard' && second == 'paper'
    prompt "Lizard eats paper."
  elsif first == 'lizard' && second == 'spock'
    prompt "Lizard poisons Spock."
  elsif first == 'spock' && second == 'scissors'
    prompt "Spock smashes scissors"
  elsif first == 'spock' && second == 'rock'
    prompt "Spock vaporizes rock"
  end
end

def outcome(player, computer)
  if win?(player, computer)
    display_outcome(player, computer)
  elsif win?(computer, player)
    display_outcome(computer, player)
  end
end

player_win_total = 0
computer_win_total = 0
tie_total = 0
system 'clear'
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock.")
prompt("Enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Must enter a name:")
  else
    break
  end
end
puts "--------------------------------------"
prompt("Hello, #{name}. Let's play!")
puts "--------------------------------------"
loop do # master game loop
  player_choice = ''
  loop do
    prompt("Choose one: rock, paper, scissors, lizard, or Spock:")
    player_choice = gets.chomp.downcase
    if CHOICES.include?(player_choice)
      break
    else
      prompt("Must choose either rock, paper, scissors, lizard, or spock")
    end
  end

  prompt("You chose #{player_choice}")
  computer_choice = CHOICES.sample
  prompt("Computer chose #{computer_choice}")
  outcome(player_choice, computer_choice)
  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_win_total += 1
  elsif win?(computer_choice, player_choice)
    computer_win_total += 1
  else
    tie_total += 1
  end

  prompt("Result:")
  puts "---------------------"
  prompt("#{name}'s win total: #{player_win_total}")
  prompt("Computer's win total: #{computer_win_total}")
  prompt("Number of ties: #{tie_total}")
  puts "---------------------"

  if player_win_total >= 5
    prompt("-------------------------------------------")
    prompt("You have won 5 games. You are the champion!")
    prompt("-------------------------------------------")
    break
  elsif computer_win_total >= 5
    prompt("---------------------------------------------")
    prompt("Computer has won 5 games. It is the champion!")
    prompt("---------------------------------------------")
    break
  end

  prompt("Do you want to play again?")
  play_again = gets.chomp
  if play_again.downcase.start_with?('y')
    system 'clear'
    next
  else
    break
  end
end # end master loop

prompt("Thanks for playing! Goodbye, #{name}.")
