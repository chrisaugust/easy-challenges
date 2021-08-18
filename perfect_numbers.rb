class PerfectNumber
  def self.classify(n)
    raise StandardError.new if n < 1
    case
    when n == find_sum_of_divisors(n)
      'perfect'
    when n > find_sum_of_divisors(n)
      'deficient'
    when n < find_sum_of_divisors(n)
      'abundant'
    end
  end

  class << self
    private
  
    def find_sum_of_divisors(n)
      (1...n).select { |possible_divisor| n % possible_divisor == 0 }.reduce(:+)
    end
  end
end
