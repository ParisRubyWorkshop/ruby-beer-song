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
    verse = Verse.new(number)
    LINES.map { |line| line % verse }.map(&:capitalize).join
  end

  private

  LINES = [
    "%{bottle} of beer on the wall, %{bottle} of beer.\n".freeze,
    "%{action}, %{bottle_left} of beer on the wall.\n".freeze,
  ].freeze

end

Verse = Struct.new(:number) do
  def to_hash
    @hash ||=
      case number
      when 0 then defaults.merge(bottle_0)
      when 1 then defaults.merge(bottle_1)
      when 2 then defaults.merge(bottle_2)
      else defaults
      end
  end

  private

  def defaults
    {
      bottle: "#{number} bottles",
      bottle_left: "#{number - 1} bottles",
      action: "Take one down and pass it around",
    }
  end

  def bottle_0
    {
      bottle: "no more bottles",
      bottle_left: "99 bottles",
      action: "Go to the store and buy some more",
    }
  end

  def bottle_1
    {
      bottle: "1 bottle",
      bottle_left: "no more bottles",
      action: "Take it down and pass it around",
    }
  end

  def bottle_2
    {
      bottle_left: "1 bottle",
    }
  end
end
