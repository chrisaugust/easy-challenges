####################
## ROMAN NUMERALS ##
####################
# 
# PROBLEM
# Convert decimal numbers to Roman Numerals
# Only handle numbers up to 3000
#
# EXAMPLES
# 1 ->    I
# 2 ->    II
# 3 ->    III
# 4 ->    IV
# 5 ->    V
# 6 ->    VI
# 7 ->    VII
# 8 ->    VIII
# 9 ->    IX
# 10 ->   X
# 50 ->   L
# 100 ->  C
# 500 ->  D
# 1000 -> M
# 1990 -> MCMXC
# 2008 -> MMVIII
#
# [M, D, C, L, X, V, I]
#
# DATA STRUCTURES/TYPE SIGNATURE
# Hash for holding conversion
# Integer -> String
#
# ALGORITHM
# convert argument to digits with raised to respective powers of 10; assign to var
#   eg 2008 -> [2000, 0, 0, 8]
# convert each number in array to roman numerals
# concatenate and return (as string) the roman numerals that represent 
# the argument decimal number

class RomanNumeral
  attr_reader :number

  DECIMAL_TO_ROMAN = { 1 => 'I',
                       2 => 'II',
                       3 => 'III',
                       4 => 'IV',
                       5 => 'V',
                       6 => 'VI',
                       7 => 'VII',
                       8 => 'VIII',
                       9 => 'IX',
                       10 => 'X',
                       20 => 'XX',
                       30 => 'XXX',
                       40 => 'XL',
                       50 => 'L',
                       60 => 'LX',
                       70 => 'LXX',
                       80 => 'LXXX',
                       90 => 'XC',
                       100 => 'C',
                       200 => 'CC',
                       300 => 'CCC',
                       400 => 'CD',
                       500 => 'D',
                       600 => 'DC',
                       700 => 'DCC',
                       800 => 'DCCC',
                       900 => 'CM',
                       1000 => 'M',
                       2000 => 'MM',
                       3000 => 'MMM',
                       0    => '' }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral_str = ''
    number_components = decimal_to_number_components
    p number_components
    number_components.reverse_each { |number| roman_numeral_str << DECIMAL_TO_ROMAN[number] }
    p roman_numeral_str
  end

  private

  def decimal_to_number_components
    digits_array = number.digits
    number_components = []
    digits_array.each_with_index { |d, i| number_components << d * 10**(i) }
    number_components
  end
end
