# Series
#
# PROBLEM
# Write a program that will take a string of digits and return all the possible 
# consecutive number series of a specified length in that string.
#
# EXAMPLES
# "01234" has the following 3-digit and 4-digit series:
#
#    012
#    123
#    234
# 
#    0123
#    1234
#
# DATA STRUCTURE
# Array
#
# ALGORITHM
# Series#slices(n)
# - initialize empty results array
# - initialize counter idx to 0
# - iterate over number_str from 0 to -n
#   - break loop if idx > number_str.size - n
#   - take a slice of the string: slice = number_str.slice(idx, n)
#   - convert each char of number_str to integer and append to results:
#       results << slice.chars.map(&:to_i))
#   - increment counter
# - return results array

class Series
  attr_reader :number_str

  def initialize(str)
    @number_str = str
  end

  def slices(n)
    raise ArgumentError.new if n > number_str.size
    
    results = []
    idx = 0
    loop do
      break if idx > number_str.size - n
      slice = number_str.slice(idx, n)
      results << slice.chars.map(&:to_i)
      idx += 1
    end
    results
  end
end
