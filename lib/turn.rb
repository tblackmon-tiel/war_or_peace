class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = set_type
    @winner = set_winner
  end

  def set_type
    player1_card1 = @player1.deck.rank_of_card_at(0)
    player1_card3 = @player1.deck.rank_of_card_at(2)
    player2_card1 = @player2.deck.rank_of_card_at(0)
    player2_card3 = @player2.deck.rank_of_card_at(2)

    if player1_card1 != player2_card1
      :basic
    elsif (player1_card1 == player2_card1) && (player1_card3 == player2_card3)
      :mutually_assured_destruction
    else
      :war
    end
  end

  def set_winner
    if @type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end

    elsif @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end

    else
      'No Winner.'
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif @type == :war
      3.times {@spoils_of_war << @player1.deck.cards.shift}
      3.times {@spoils_of_war << @player2.deck.cards.shift}
    else
      3.times {@player1.deck.cards.shift}
      3.times {@player2.deck.cards.shift}
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.cards << spoil
    end
    @spoils_of_war.clear
  end
end