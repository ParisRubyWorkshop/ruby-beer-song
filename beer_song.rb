class BeerSong

  def lyrics
    verses(99, 0)
  end

  def verses(start, stop)
    start.downto(stop)
      .map { |number| verse(number) }
      .join("\n")
  end

  def verse(number)
    verse = Verse.bottle(number)
    LINES.map { |line| line % verse }.map(&:capitalize).join
  end

  private

  LINES = [
    "%{count} of beer on the wall, %{count} of beer.\n".freeze,
    "%{action}, %{count_left} of beer on the wall.\n".freeze,
  ].freeze

end

module Verse
  def self.bottle(number)
    case number
    when 0 then Bottle0
    when 1 then Bottle1
    else        Bottle
    end.new(number)
  end
end

Bottle = Struct.new(:number) do
  def to_hash
    @_to_hash ||= {count: count, count_left: count_left, action: action}
  end

  def count
    "#{number} bottles"
  end

  def count_left
    next_bottle.count
  end

  def action
    "Take one down and pass it around"
  end

  def next_bottle
    Verse.bottle(number - 1)
  end
end

class Bottle0 < Bottle
  def count
    "no more bottles"
  end

  def action
    "Go to the store and buy some more"
  end

  def next_bottle
    Verse.bottle(99)
  end
end

class Bottle1 < Bottle
  def count
    "1 bottle"
  end

  def action
    "Take it down and pass it around"
  end
end
