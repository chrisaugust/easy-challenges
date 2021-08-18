## ANAGRAMS ##
#
# PROBLEM
# Write a program that takes a word and a list of possible anagrams and selects the 
# correct sublist that contains the anagrams of the word.
#
# EXAMPLES
# For example, given the word "listen" and a list of candidates like "enlists", "google", 
# "inlets", and "banana", the program should return a list containing "inlets".
# 
# # detects anagram 
# Anagram.new('listen').match(['enlists', 'google', 'inlets', 'banana']) # -> 'inlets'
#
# # detects multiple anagrams
# Anagram.new('allergy').match(%w( gallery ballerina regally clergy largely leading )) # -> ['gallery', 'largely', 'regally']
#
# # anagrams are case insensitive
# Anagram.new('Orchestra').match(['cashregister', 'Carthorse', 'radishes]) # -> 'Carthorse'
#
# see test cases for more examples
#
# DATA STRUCTURE
# Array
#
# ALGORITHM
# Anagram#match
# - iterate over argument array with select
#   - for each word, check if the word is an anagram of @word
# - return array of anagrams
#
# Anagram#anagram?
# - invoke #sorted_letters method on @word and argument
# - compare @word to argument with #==
#
# Anagram#sorted_letters
# - downcase
# - split('') or chars
# - sort
# - join


class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(words_array)
    words_array.select { |w| anagram?(w) }
  end

  private

  def sorted_letters(w)
    w.downcase.chars.sort.join
  end

  def anagram?(w)
    return false if w.downcase == word
    sorted_letters(w) == sorted_letters(word)
  end
end
