class Verse
  def initialize(line_number)
    @line_number = line_number
  end
  attr_reader :line_number

  def first_sentence
    first_word      = "bottle".pluralize(line_number)
    first_word = first_word.capitalize if line_number == 0
    "#{first_word} of beer on the wall, #{"bottle".pluralize(line_number)} of beer.\n" \
  end

  def second_sentence
    if line_number == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      one_word        = line_number == 1 ? "it" : "one"
      "Take #{one_word} down and pass it around, #{"bottle".pluralize(line_number - 1)} of beer on the wall.\n"
    end
  end
end