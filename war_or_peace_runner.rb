Dir["./lib/*.rb"].each {|file| require file} # fun way to require all ruby files in ./lib

full_card_deck = []
deck1_cards = []
deck2_cards = []

full_card_deck << card_spade1 = Card.new(:spade, '2', 2)
full_card_deck << card_spade2 = Card.new(:spade, '3', 3)
full_card_deck << card_spade3 = Card.new(:spade, '4', 4)
full_card_deck << card_spade4 = Card.new(:spade, '5', 5)
full_card_deck << card_spade5 = Card.new(:spade, '6', 6)
full_card_deck << card_spade6 = Card.new(:spade, '7', 7)
full_card_deck << card_spade7 = Card.new(:spade, '8', 8)
full_card_deck << card_spade8 = Card.new(:spade, '9', 9)
full_card_deck << card_spade9 = Card.new(:spade, '10', 10)
full_card_deck << card_spade10 = Card.new(:spade, 'Jack', 11)
full_card_deck << card_spade11 = Card.new(:spade, 'Queen', 12)
full_card_deck << card_spade12 = Card.new(:spade, 'King', 13)
full_card_deck << card_spade13 = Card.new(:spade, 'Ace', 14)

full_card_deck << card_heart1 = Card.new(:heart, '2', 2)
full_card_deck << card_heart2 = Card.new(:heart, '3', 3)
full_card_deck << card_heart3 = Card.new(:heart, '4', 4)
full_card_deck << card_heart4 = Card.new(:heart, '5', 5)
full_card_deck << card_heart5 = Card.new(:heart, '6', 6)
full_card_deck << card_heart6 = Card.new(:heart, '7', 7)
full_card_deck << card_heart7 = Card.new(:heart, '8', 8)
full_card_deck << card_heart8 = Card.new(:heart, '9', 9)
full_card_deck << card_heart9 = Card.new(:heart, '10', 10)
full_card_deck << card_heart10 = Card.new(:heart, 'Jack', 11)
full_card_deck << card_heart11 = Card.new(:heart, 'Queen', 12)
full_card_deck << card_heart12 = Card.new(:heart, 'King', 13)
full_card_deck << ard_heart13 = Card.new(:heart, 'Ace', 14)

full_card_deck << card_diamond1 = Card.new(:diamond, '2', 2)
full_card_deck << card_diamond2 = Card.new(:diamond, '3', 3)
full_card_deck << card_diamond3 = Card.new(:diamond, '4', 4)
full_card_deck << card_diamond4 = Card.new(:diamond, '5', 5)
full_card_deck << card_diamond5 = Card.new(:diamond, '6', 6)
full_card_deck << card_diamond6 = Card.new(:diamond, '7', 7)
full_card_deck << card_diamond7 = Card.new(:diamond, '8', 8)
full_card_deck << card_diamond8 = Card.new(:diamond, '9', 9)
full_card_deck << card_diamond9 = Card.new(:diamond, '10', 10)
full_card_deck << card_diamond10 = Card.new(:diamond, 'Jack', 11)
full_card_deck << card_diamond11 = Card.new(:diamond, 'Queen', 12)
full_card_deck << card_diamond12 = Card.new(:diamond, 'King', 13)
full_card_deck << card_diamond13 = Card.new(:diamond, 'Ace', 14)

full_card_deck << card_club1 = Card.new(:club, '2', 2)
full_card_deck << card_club2 = Card.new(:club, '3', 3)
full_card_deck << card_club3 = Card.new(:club, '4', 4)
full_card_deck << card_club4 = Card.new(:club, '5', 5)
full_card_deck << card_club5 = Card.new(:club, '6', 6)
full_card_deck << card_club6 = Card.new(:club, '7', 7)
full_card_deck << card_club7 = Card.new(:club, '8', 8)
full_card_deck << card_club8 = Card.new(:club, '9', 9)
full_card_deck << card_club9 = Card.new(:club, '10', 10)
full_card_deck << card_club10 = Card.new(:club, 'Jack', 11)
full_card_deck << card_club11 = Card.new(:club, 'Queen', 12)
full_card_deck << card_club12 = Card.new(:club, 'King', 13)
full_card_deck << card_club13 = Card.new(:club, 'Ace', 14)

full_card_deck.shuffle!

# loops through the card array using the index to alternate delivering cards to deck1 and deck2
# pretty sure there's no real difference in giving the first half to deck1 rather than alternating, but this is more traditional!
full_card_deck.each_index do |index|
  if index % 2 == 0
    deck1_cards << full_card_deck[index]
  else
    deck2_cards << full_card_deck[index]
  end
end

deck1 = Deck.new(deck1_cards)
deck2 = Deck.new(deck2_cards)

player1 = Player.new('Player 1', deck1)
player2 = Player.new('Player 2', deck2)

controller = GameController.new(player1, player2)

controller.start