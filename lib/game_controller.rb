require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'

class GameController
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{self.player1.name} and #{self.player2.name}."
    p "Type 'GO' to start the game!"

    turn_counter = 1

    until @player1.has_lost? == true || @player2.has_lost? == true || turn_counter >= 1000000 do
      current_turn = Turn.new(self.player1, self.player2)
      winner = current_turn.winner
      current_turn.pile_cards
      print "Turn #{turn_counter}: "

      if current_turn.type == :basic
        p "#{winner.name} won 2 cards"
        current_turn.award_spoils(winner)
      elsif current_turn.type == :war
        p "WAR - #{winner.name} won 6 cards"
        current_turn.award_spoils(winner)
      elsif current_turn.type == :final_war
        p "FINAL WAR - #{winner.name} wins the turn as their opponent does not have enough cards for a war!"
      else
        p "*mutually assured destruction* 6 cards removed from play"
      end

      if player1.has_lost? == true
        p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif player2.has_lost? == true
        p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      end

      turn_counter += 1
    end
  end
end