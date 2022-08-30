class Triangle
  # write code here

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
   if ((side1 == side2) && (side1 == side3))
    return :equilateral
   elsif ((side1 == side2) || (side1 == side3) || (side2 == side3))
    return :isosceles
   else
    return :scalene
   end
  end

  def sides_greatre_than_zero?
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  def validate_triangle
    raise TriangleError unless sides_greatre_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end
