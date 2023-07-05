require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    generator = CardGenerator.new("./cards.txt")

    expect(generator).to be_an_instance_of(CardGenerator)
  end

  it 'can be passed a file' do
    generator = CardGenerator.new("./cards.txt")

    expect(generator.filename).to eq("./cards.txt")
  end

  it 'can create an array of lines from a file' do
    generator = CardGenerator.new("./cards_test.txt")

    p generator.generate_cards

    expect(generator.generate_cards).not_to be_empty
  end

  it 'can create a card object from a file' do
    generator = CardGenerator.new("./cards_test.txt")

    expect(generator.cards.first).to be_an_instance_of(Card)
    expect(generator.cards.first.rank).to eq(2)
    expect(generator.cards.first.value).to eq("2")
    expect(generator.cards.first.suit).to eq(:Heart)
  end
end