CHOICES = %w(r p s)

def prompt(msg)
  puts "=> #{msg}"
end

def choice_conversion(choice)
  case choice[0]
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    if player == 'rock'
      prompt "Rock breaks scissors."
    elsif player == 'paper'
      prompt "Paper covers rock."
    else
      prompt "Scissors cut paper."
    end
    prompt "You won!"
  elsif win?(computer, player)
    if computer == 'rock'
      prompt "Rock breaks scissors."
    elsif computer == 'paper'
      prompt "Paper covers rock."
    else
      prompt "Scissors cut paper."
    end
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end
player_win_total = 0
computer_win_total = 0
tie_total = 0
system 'clear'
prompt("Welcome to Rock, Paper, Scissors. Enter your name:")
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
    prompt("Choose rock, paper, or scissors:")
    player_choice = gets.chomp.downcase
    if CHOICES.include?(player_choice[0])
      player_choice = choice_conversion(player_choice)
      break
    else
      prompt("Must choose either rock, paper, or scissors (r/p/s)")
    end
  end

  prompt("You chose #{player_choice}")
  computer_choice = choice_conversion(CHOICES.sample)
  prompt("Computer chose #{computer_choice}")
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
