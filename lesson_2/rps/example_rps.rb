require 'pry'
CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors', 'l' => 'lizard', 'sp' => 'spock' }

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  (first == 'r' && second == 's') ||
    (first == 'r' && second == 'l') ||
    (first == 's' && second == 'p') ||
    (first == 's' && second == 'l') ||
    (first == 'p' && second == 'r') ||
    (first == 'p' && second == 'sp') ||
    (first == 'l' && second == 'p') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 'r') ||
    (first == 'sp' && second == 's')
end

def display_score(player_win_total, computer_win_total)
  prompt("Wins:")
  prompt("--------------")
  prompt("You | Computer")
  prompt("----|---------")
  prompt("  #{player_win_total} | #{computer_win_total}")
  prompt("----|---------")
end

system('clear')
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
player_win_total = 0
computer_win_total = 0
loop do # main loop
  player_choice = ''
  computer_choice = ''
  loop do # round loop
    loop do # player choice loop
      prompt("Choose rock, paper, scissors, lizard, spock: r/p/s/l/sp")
      player_choice = gets.chomp.downcase
      break if CHOICES.keys.include?(player_choice)
        prompt("That's not a valid choice.")
    end # end player choice loop

    computer_choice = CHOICES.keys.sample
    if player_choice == computer_choice
      prompt("Computer chooses #{CHOICES[computer_choice]}, too.")
      prompt("It's a tie! Let's go again...")
      next
    elsif win?(player_choice, computer_choice)
      prompt("You win!")
      player_win_total += 1
      break
    else
      prompt("You lose!")
      computer_win_total += 1
      break
    end
  end # end round loop

  prompt("You entered #{CHOICES[player_choice]}; Computer chose #{CHOICES[computer_choice]}.")
  if player_win_total == 5
    prompt("You are the first to win 5 rounds. Congratulations!")
    prompt('')
    display_score(player_win_total, computer_win_total)
    break
  elsif computer_win_total == 5
    prompt("The computer is the first to win 5 rounds.")
    prompt('')
    display_score(player_win_total, computer_win_total)
    break
  end

  prompt('')
  display_score(player_win_total, computer_win_total)
  prompt('')

  prompt("Do you want to play again? 'y' or 'n' ")
  answer = gets.chomp.downcase
  answer != 'n' ? next : break
  
end # end main loop

prompt("Thanks for playing Rock, Paper, Scissors, Lizard, Spock!")
