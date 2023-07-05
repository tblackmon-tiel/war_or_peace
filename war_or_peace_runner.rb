Dir["./lib/*.rb"].each {|file| require file} # fun way to require all ruby files in ./lib

full_card_deck = CardGenerator.new("./cards.txt").cards
# require 'pry'; binding.pry
deck1_cards = []
deck2_cards = []

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

# use these for debugging
# debug_deck1 = Deck.new([card_club1, card_club2, card_club3, card_heart10, card_heart5, card_heart12])
# debug_deck2 = Deck.new([card_diamond1, card_diamond10, card_diamond3, card_spade4, card_spade12, card_club12])


player1 = Player.new('Player 1', deck1)
player2 = Player.new('Player 2', deck2)

controller = GameController.new(player1, player2)

controller.start