class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    num_eql_sides = sides.uniq.size  
    case num_eql_sides
    when 1
      'equilateral'
    when 2
      'isosceles'
    else
      'scalene'
    end
  end
  
  private

  def valid?
    p sides
    sides.all? { |s| s > 0 } && 
    sides[0] + sides[1] > sides[2] && 
    sides[0] + sides[2] > sides[1] && 
    sides[1] + sides[2] > sides[0]
  end
end
