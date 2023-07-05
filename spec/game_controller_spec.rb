require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_controller'

RSpec.describe GameController do
  it 'exists' do
    player1 = Player.new('Tyler', [])
    player2 = Player.new('Kiwi', [])

    controller = GameController.new(player1, player2)
    expect(controller).to be_an_instance_of(GameController)
  end

  it 'has two players' do
    player1 = Player.new('Tyler', [])
    player2 = Player.new('Kiwi', [])

    controller = GameController.new(player1, player2)
    expect(controller.player1.name).to eq('Tyler')
    expect(controller.player2.name).to eq('Kiwi')
  end

  it 'can result in a win for a player' do
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:club, '5', 5)
    card3 = Card.new(:club, '3', 3)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2, card3])

    player1 = Player.new('Loser', deck1)
    player2 = Player.new('Winner', deck2)

    controller = GameController.new(player1, player2)

    expect(player1.deck.cards).to eq([card1])
    expect(player2.deck.cards).to eq([card2, card3])

    expect(controller.player1.name).to eq('Loser')

    controller.start
    expect(player1.has_lost?).to be true
  end

  it 'can handle a game ending in final war' do
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:club, '3', 3)
    card4 = Card.new(:spade, 'Ace', 14)
    card5 = Card.new(:diamond, 'Queen', 12)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2, card3, card4, card5])

    player1 = Player.new('Loser', deck1)
    player2 = Player.new('Winner', deck2)

    controller = GameController.new(player1, player2)

    controller.start
    expect(player1.has_lost?).to be true
  end

  it 'can handle a game ending from a war' do
    card1 = Card.new(:club, 'Ace', 14)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:club, '3', 3)
    card4 = Card.new(:spade, 'Ace', 14)
    card5 = Card.new(:diamond, 'Queen', 12)
    card6 = Card.new(:diamond, 'Ace', 14)

    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])

    player1 = Player.new('Loser', deck1)
    player2 = Player.new('Winner', deck2)

    controller = GameController.new(player1, player2)

    controller.start
    expect(player1.has_lost?).to be true
  end
end