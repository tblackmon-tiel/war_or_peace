class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end

  def high_ranking_cards
    high_ranking_cards_array = @cards.find_all do |card|
      card.rank >= 11
    end
    high_ranking_cards_array
  end

  def percent_high_ranking
    # round to 4 decimals and multiply by 100 to convert to percentage
    100*(high_ranking_cards.size.to_f / @cards.size.to_f).round(4)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end