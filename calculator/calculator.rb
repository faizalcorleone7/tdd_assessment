class Calculator

  attr_reader :delimiter
  def add(numbers_string)
    parse(numbers_string)
    numbers_string.split(delimiter).map(&:to_i).sum
  end

  private

  def parse(numbers_string)
    parsed_delimiter = nil
    if numbers_string.include?("//")
      segments = numbers_string.split("//")
      parsed_delimiter = segments[1].split("\n").first
    end
    @delimiter = parsed_delimiter || ","
  end
end
