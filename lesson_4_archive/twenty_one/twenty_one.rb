# Pseudo-code
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def calculate_total(cards)
  arr = cards.map { |card| card[1] }
  total = 0
  arr.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0 # (J, Q, K)
      total += 10
    else
      total += value.to_i
    end
  end

  # correct for Aces
  arr.select { |card| card == 'A' }.count.times do
    if total > 21
      total -= 10
    end
  end
  total
end

def busted?(cards)
  calculate_total(cards) > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_hand, player_hand)
  player_total = calculate_total(player_hand)
  dealer_total = calculate_total(dealer_hand)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

  case result
  when :player_busted
    prompt("You busted! Dealer wins!")
  when :dealer_busted
    prompt("Dealer busted! You win!")
  when :player
    prompt("You win!")
  when :dealer
    prompt("Dealer wins!")
  when :tie
    prompt("It's a tie!")
  end
end

def play_again?
  puts "------------"
  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do # main loop
  prompt("Welcome to Twenty-One!")

  # initialize variables
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  # initial deal
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end

  prompt("Dealer shows: #{dealer_hand[1]}")
  prompt("You have: #{player_hand[0]} and #{player_hand[1]} for a total of #{calculate_total(player_hand)}")

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt("Would you like to (h)it or (s)tay?")
      player_turn = gets.chomp.downcase
      if ['h', 's'].include?(player_turn)
        break
      else
        prompt("Sorry, must enter 'h' or 's'.")
      end
    end

    if player_turn == 'h'
      player_hand << deck.pop
      prompt("You chose to hit!")
      prompt("Your cards are now: #{player_hand}")
      prompt("Your total is now: #{calculate_total(player_hand)}")
    end

    break if player_turn == 's' || busted?(player_hand)
  end

  if busted?(player_hand)
    display_result(dealer_hand, player_hand)
    play_again? ? next : break
  else
    prompt("You stayed at #{calculate_total(player_hand)}")
  end

  # dealer turn
  prompt("Dealer turn...")

  loop do
    break if busted?(dealer_hand) || calculate_total(dealer_hand) >= 17

    prompt("Dealer hits!")
    dealer_hand << deck.pop
    prompt("Dealer's cards are now: #{dealer_hand}")
  end

  dealer_total = calculate_total(dealer_hand)
  if busted?(dealer_hand)
    prompt("Dealer total is now #{dealer_total}")
    display_result(dealer_hand, player_hand)
    play_again? ? next : break
  else
    prompt("Dealer stays at #{dealer_total}")
  end

  # both player and dealer stay - compare cards
  puts "==============="
  prompt("Dealer has #{dealer_hand} for a total of #{calculate_total(dealer_hand)}")
  prompt("Player has #{player_hand} for a total of #{calculate_total(player_hand)}")
  puts "==============="

  display_result(dealer_hand, player_hand)

  break unless play_again?
end # end main loop

prompt("Thank you for playing Twenty-One! Goodbye!")
