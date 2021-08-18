class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?(number)
    octal_number = number.to_i.digits
    decimal_number = 0
    octal_number.each_with_index { |n, idx| decimal_number += (n * (8 ** idx)) }
   
    decimal_number
  end

  private
  
  def valid_octal?(n)
    n.chars.all? { |char| char =~ /[0-7]/ }
  end
end
