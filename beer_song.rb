class BeerSong
  def initialize
  end

  def verse(line_number)
    one_word        = line_number == 1 ? "it" : "one"
    first_word      = pluralize("bottle", line_number)
    second_sentence = "Take #{one_word} down and pass it around, #{pluralize("bottle", line_number - 1)} of beer on the wall.\n"
    if line_number == 0
      first_word = first_word.capitalize
      second_sentence = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    "#{first_word} of beer on the wall, #{pluralize("bottle", line_number)} of beer.\n" \
    "#{second_sentence}"
  end

  def verses(a, b)
    (b..a).map do |index|
      verse(index)
    end.reverse.join("\n")
  end

  def pluralize(string, count)
    word = (count > 1 || count == 0) ? "#{string}s" : string
    count = "no more" if count == 0
    "#{count} #{word}"
  end

  def lyrics
    verses(99, 0)
  end

end