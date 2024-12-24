module SpecUtils


  class NumberAndSumGenerator
    attr_reader :no_of_numbers, :final_sum, :numbers
    def initialize(no_of_numbers)
      @no_of_numbers = no_of_numbers
      @final_sum = 0
      @numbers = []
    end

    def generate_test_data
      @final_sum = 0
      generate_numbers
      calculate_sum
    end

    def generate_negative_test_data
      generate_numbers
      @numbers = numbers.map { |number| number * -1 }
    end

    private

    def generate_numbers
      no_of_numbers.times {
        # rand is non-negative by default, in case code is reviewed
        @numbers << rand(1..100)
      }
    end

    def calculate_sum
      @final_sum = numbers.sum
    end

  end

  class WhiteSpaceStringGenerator
    WHITESPACE_CHARACTERS = [" ", "\t", "\n", "\r", "\f", "\v"]
    def self.generate(no_of_times, whitespace=nil)
      final_string = ""
      no_of_times.times {
        if whitespace.nil?
          whitespace = WHITESPACE_CHARACTERS[rand(WHITESPACE_CHARACTERS.length)]
        end
        final_string = final_string + whitespace
      }
      final_string
    end
  end
end
