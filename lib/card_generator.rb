require_relative 'card'
class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = generate_cards
  end

  def generate_cards
    file_lines = []
    @cards = []
    File.foreach(@filename) {|line| file_lines << line.chomp!}

    file_lines.each do |line|
      split_line = line.split(', ')
      @cards << Card.new(split_line[1].to_sym, split_line[0], split_line[2].to_i)
    end

    @cards
  end
end