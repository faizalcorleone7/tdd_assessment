class Calculator

  attr_reader :delimiter, :negative_arguments

  def initialize
    @negative_arguments = []
    @filtered_numbers = []
  end

  def add(numbers_string)
    parse(numbers_string)
    numbers = numbers_string.split(delimiter).map(&:to_i)
    validates_numbers(numbers)
    raise ArgumentError, "negative numbers not allowed #{negative_arguments.join(",")}" if negative_arguments.any?
    sum = 0
    numbers.each { |number| sum += number if number < 1000}
    sum
  end

  private

  def validates_numbers(numbers)
    numbers.each { |number| negative_arguments.push(number) if number < 0 }
  end

  def parse(numbers_string)
    parsed_delimiter = nil
    if numbers_string.include?("//")
      segments = numbers_string.split("//")
      parsed_delimiter = segments[1].split("\n").first
    end
    @delimiter = parsed_delimiter || ","
  end
end
