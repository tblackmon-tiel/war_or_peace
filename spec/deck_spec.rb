require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)    
    card3 = Card.new(:heart, 'Ace', 14)    
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end
  
  it "can find the rank of a card at an index" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)    
    card3 = Card.new(:heart, 'Ace', 14)    
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "can return high value cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)    
    card3 = Card.new(:heart, 'Ace', 14)    
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "can return the percent of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)    
    card3 = Card.new(:heart, 'Ace', 14)    
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove a card from the top of the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)    
    card3 = Card.new(:heart, 'Ace', 14)    
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])

    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(50.0)
  end
end