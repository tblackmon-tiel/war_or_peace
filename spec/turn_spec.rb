require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    
    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2) 

    turn = Turn.new(player1, player2)

    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
    expect(turn.spoils_of_war).to be_empty
  end

  it 'has a :basic type of turn' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    
    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2) 

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end

  it 'has a winner (for :basic turns)' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    
    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2) 

    turn = Turn.new(player1, player2)

    winner = turn.winner

    expect(winner).to eq(player1)
  end

  it 'can send cards to the spoils pile (for :basic turns)' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    
    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2) 

    turn = Turn.new(player1, player2)

    winner = turn.winner

    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card1, card3])

    expect(turn.player1.deck.cards).to eq([card2, card5, card8])
    expect(turn.player2.deck.cards).to eq([card4, card6, card7])
  end

  it 'can award spoils to the winner (for :basic turns)' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    
    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2) 

    turn = Turn.new(player1, player2)

    winner = turn.winner

    turn.pile_cards
    turn.award_spoils(winner)

    # this format breaks with shuffling introduced
    # expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    # expect(turn.player2.deck.cards).to eq([card4, card6, card7])

    expect(turn.player1.deck.cards.size).to eq(5)
    expect(turn.player2.deck.cards.size).to eq(3)
  end

  it 'can have a turn type of :war' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2) 

    expect(turn.type).to eq(:war)
  end

  it 'can have a winner (for :war type)' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2) 
    expect(turn.type).to eq(:war)

    winner = turn.winner

    expect(winner).to eq(player2)
  end

  it 'can send cards to the spoils pile (for :war type)' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2) 
    expect(turn.type).to eq(:war)

    winner = turn.winner

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
  end

  it 'can award the winner (for :war type)' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2) 
    expect(turn.type).to eq(:war)

    winner = turn.winner

    turn.pile_cards
    turn.award_spoils(winner)

    # this format breaks with shuffling introduced
    # expect(turn.player1.deck.cards).to eq([card8])
    # expect(turn.player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])

    expect(turn.player1.deck.cards.size).to eq(1)
    expect(turn.player2.deck.cards.size).to eq(7)
  end

  it 'can have a :mutually_assured_destruction type turn' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)    
    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it 'does not have a winner of :mutually_assured_destruction turns' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)    
    expect(turn.type).to eq(:mutually_assured_destruction)

    winner = turn.winner
    expect(winner).to eq('No Winner.')
  end

  it 'removes 3 cards from each player on :mutually_assured_destruction' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)    
    expect(turn.type).to eq(:mutually_assured_destruction)

    turn.pile_cards
    expect(turn.spoils_of_war).to be_empty

    expect(turn.player1.deck.cards).to eq([card8])
    expect(turn.player2.deck.cards).to eq([card7])
  end

  it 'can have a :final_war type turn' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    # card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)    
    expect(turn.type).to eq(:final_war)
  end

  it 'can clear the losers deck on a :final_war turn' do
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    # card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    

    deck1 = Deck.new([card1, card2])    
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)    
    expect(turn.type).to eq(:final_war)

    turn.pile_cards
    expect(player1.deck.cards.size).to eq(0)
    expect(player1.has_lost?).to be true
  end
end