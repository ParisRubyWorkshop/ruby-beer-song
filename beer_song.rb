class String
  def pluralize(count)
    string = self.to_s
    word = (count > 1 || count == 0) ? "#{string}s" : string
    count = "no more" if count == 0
    "#{count} #{word}"
  end
end

class BeerSong

  def verse(line_number)
    current_verse = Verse.new(line_number)
    current_verse.first_sentence << current_verse.second_sentence
  end

  def verses(a, b)
    (b..a).map do |index|
      verse(index)
    end.reverse.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

end