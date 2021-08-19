# Sum of Multiples
#
# PROBLEM
# Write a program that, given a natural number and a set of one or more other numbers, 
# can find the sum of all the multiples of the numbers in the set that are less than 
# the first number. 
# 
# If the set of numbers is not given, use a default set of 3 and 5.
#
# EXAMPLES
# If we list all the natural numbers up to, but not including, 20 that are multiples of 
# either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.
#
# DATA STRUCTURE
# Arrays to hold multiples of arguments
#
# ALGORITHM
# SumOfMultiples::to(num)
# - initialize empty results array
# - iterate over a range from 3 to target number (3...target_num), 
#   with a block argument that has block var 'n'
#   - within block check if n % arg == 0, if so append to results array
# - repeat for range (5...target_num)
# - return results.uniq.reduce(0, :+)
#
# SumOfMultiples#to(num)
# - initialize empty results array
# - iterate over @numbers array
#   - iterate over range from array element to target num
#   - 

class SumOfMultiples
  attr_reader  :numbers
  def initialize(num1=3, num2=5, *nums)
    @numbers = [num1, num2, *nums]
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def to(num)
    multiples = []
    numbers.each do |start_num|
      multiples <<  multiples_within_range(start_num, num)
    end
    multiples.flatten.uniq.reduce(0, :+)
  end

  private
 
  def multiples_within_range(start, stop)
    multiples = []
    (start...stop).each { |n| multiples << n if n % start == 0 } 
    multiples
  end
end
