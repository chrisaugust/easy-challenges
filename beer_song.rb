###############
## Beer Song ##
###############
#
# PROBLEM
# Write a program that can generate the verses of the '99 Bottles' beer song.
#
# EXAMPLES
# BeerSong.verse(99) # =>
# "99 bottles of beer on the wall, 99 bottles of beer.\n
# Take one down and pass it around, 98 bottles of beer on the wall.\n"
#
# see test cases for more examples
#
# DATA STRUCTURE
# Constant holds an array with the base lyric, which is modified through
# string interpolation to make the appropriate verse.
#
# ALGORITHM
# 
# Verse#verse(bottles)
# - initialize lyrics to empty string
# - append return value of #choose_appropriate_verse to lyrics
# - return lyrics
#
# Verse#verses(starting_bottles, ending_bottles)
# - initialize lyrics to empty string
# - assign @bottles to starting_bottles argument
# - if ending_bottles argument provided, loop:
# - if ending_bottles.nil?
#   - invoke #substitute_num_bottles and append return value to lyris
# - loop
#   - break if ending_bottles > @bottles
#   - invoke #substitute_num_bottles and append return value to lyrics
#   - decrement @bottles by 1  
# - return lyrics
#
# Verse#choose_appropriate_verse(bottles)
# - invoke #substitute_num_bottles to modify and return string in LYRICS[2] with
#   value of bottles substituted
#
# Verse#substitute_num_bottles
# - substitute current value of @bottles for '##' in LYRICS[2] and @bottles-1 for '#'
#
# BeerSong::verse(bottles)
# - create a new instance of Verse with bottles passed in as argument
# - invoke the Verse#verse method
#
# BeerSong::verses(starting_bottles, ending_bottles)
# - assign multiple_verses an empty array
# - create a range from ending_bottles to starting bottles, convert to an array, and 
#   reverse it
# - iterate over the array with block variable bottles
#   - pass bottles as argument to BeerSong::verse and append the return value
#     to multiple_verses
# - return multiple_verses.join("\n")
#
# BeerSong::lyrics
# - invoke the ::verses method with arguments 99 and 0

class Verse
  attr_reader :bottles

  # LYRICS[0] when 0 bottles, 
  # LYRICS[1] for 1 bottle, 
  # LYRICS[2] with regex substitution for 2..99 bottles
  LYRICS = ["No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n", 
            "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n", 
            "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n",
            "## bottles of beer on the wall, ## bottles of beer.\nTake one down and pass it around, # bottles of beer on the wall.\n"]

  def initialize(bottles)
    @bottles = bottles
  end

  def verse
    verse_lyrics = ""
    verse_lyrics << choose_appropriate_verse
  end

  private
  
  def choose_appropriate_verse
    case bottles
    when 0
      LYRICS[0]
    when 1
      LYRICS[1]
    when 2
      LYRICS[2]
    else
      substitute_num_bottles
    end
  end
  
  def substitute_num_bottles
    verse = LYRICS[3].dup
    verse.gsub!(/##/, "#{bottles}")
    verse.gsub!(/#/, "#{bottles - 1}")
  end
end

class BeerSong
  def self.verse(bottles)
    Verse.new(bottles).verse
  end

  def self.verses(starting_bottles, ending_bottles)
    multiple_verses = []

    (ending_bottles..starting_bottles).to_a.reverse_each do |bottles|
      multiple_verses << verse(bottles)
    end

    multiple_verses.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
