require 'rspec'
require_relative '../calculator/calculator'

RSpec.describe Calculator do

  describe 'add numbers successfully' do
    context "when adding numbers which are comma seperated" do
      it 'adds all numbers' do
        calculator = Calculator.new
        expect(calculator.new.add("3,5")).to eq(8)
      end
    end
  end

end
