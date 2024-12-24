class Calculator
  def add(numbers_string)
    numbers_string.split(",").map(&:to_i).sum
  end
end
