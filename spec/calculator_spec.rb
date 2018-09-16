# spec/calculator_spec.rb
require 'calculator'
describe Calculator do
    let(:c){Calculator.new}

    describe '#add' do
        it 'returns the sum of its postive arguments' do
              expect(c.add(1, 2)).to eq(3)
        end
        it 'returns the sum of its negative arguments' do
            expect(c.add(-1, 2)).to eq(1)
        end
        it 'returns the sum of its float arguments' do
            expect(c.add(0.1, 0.2)).to be_within(0.5).of(0.3)
        end
        it 'returns the sum of its integer and float arguments' do
            expect(c.add(1, 0.2)).to eq(1.2)
        end
    end

    describe '#subtract' do
        it 'returns the difference of its postive arguments' do
            expect(c.subtract(1, 2)).to eq(-1)
        end
        it 'returns the difference of with a negative argument' do
            expect(c.subtract(1, -2)).to eq(3)
        end
        it 'returns the different of its float arguments' do
            expect(c.add(-0.1, -0.2)).to be_within(0.5).of(0.1)
        end
        it 'returns the difference of its float and integer arguments' do
            expect(c.subtract(1, 0.2)).to eq(0.8)
        end
    end

    describe '#multiply' do
        it 'returns the product of its arguments' do
            expect(c.multiply(2, 3)).to eq(6)
        end
        it 'returns a negative product for an odd number of negative arguments' do
            expect(c.multiply(2, -3)).to eq(-6)
        end
        it 'returns the product of its float arguments' do
            expect(c.multiply(0.2, 0.3)).to be_within(0.5).of(0.06)
        end
    end

    describe '#divide' do
        it 'returns the quotient of its arguments' do
            expect(c.divide(2, 3)).to be_within(0.5).of(0.666)
        end
        it 'raises an ArgumentError if the second argument is zero' do
            expect{c.divide(2, 0)}.to raise_error(ArgumentError)
        end
        it 'returns an integer if there is no remainder' do
            expect(c.divide(4, 2)).to eq(2)
        end
        it 'returns a float if there is a remainder' do
            expect(c.divide(2, 3)).to be_within(0.5).of(0.666)
            expect(c.divide(2, 3)).to be_a(Float)
        end
    end

    describe '#pow' do
        it 'returns the power of its postive arguemtns' do
            expect(c.pow(3, 3)).to eq(27)
        end
        it 'returns the power of its negative base' do
            expect(c.pow(-3, 3)).to eq(-27)
        end
        it 'returns the power of its negative exponent' do
            expect(c.pow(2, -2)).to eq(0.25)
        end
        it 'returns the power of its decimal arguments' do
            expect(c.pow(27, 1/3.0)).to eq(3.0)
        end
        it 'returns 1 when the exponent is 0' do
            expect(c.pow(3, 0)).to eq(1)
        end
    end

    describe '#sqrt' do
        it 'returns the square root for positive argumetns' do
            expect(c.sqrt(9)).to eq(3)
        end
        it 'raises errors for negative arguments' do
            expect{c.sqrt(-9)}.to raise_error
        end
        it 'returns integers for round roots' do
            expect(c.sqrt(9)).to eq(3)
        end
        it 'returns 2-digit decimals for non-round roots' do
            expect(c.sqrt(8)).to eq(2.83)
            expect(c.sqrt(8)).not_to eq(2.8)
        end
    end

    describe '#memory=' do
        it ' stores an object in memory' do
            c.memory = 8
            expect(c.memory).to eq(8)
        end
        it 'overwrites any previous object in memory' do
            c.memory = 8
            c.memory = 9
            expect(c.memory).to eq(9)
        end
    end

    describe '#memory' do
        it 'returns the object in memory' do
            c.memory=(9)
            expect(c.memory).to eq(9)
        end
        it 'clears memory when returned' do
            c.memory = 9
            c.memory
            expect(c.memory).to eq(nil)
        end
        it 'starts as nil' do
            expect(c.memory).to eq(nil)
        end
    end

    context '#stringify' do
        let(:c_string){Calculator.new(true)}

            describe '#add' do
                it 'should return a string' do
                    expect(c_string.add(1, 2)).to be_kind_of(String)
                end
            end
            describe '#subtract' do
                it 'should return a string' do
                    expect(c_string.subtract(1, 2)).to be_kind_of(String)
                end
            end
            describe '#multiply' do
                it 'should return a string' do
                    expect(c_string.multiply(2, 3)).to be_kind_of(String)
                end
            end
            describe '#divide' do
                it 'should return a string' do
                    expect(c_string.divide(2, 3)).to be_kind_of(String)
                end
            end
            describe '#pow' do
                it 'should return a string' do
                    expect(c_string.pow(3, 3)).to be_kind_of(String)
                end
            end
            describe '#sqrt' do
                it 'should return a string' do
                    expect(c_string.sqrt(9)).to be_kind_of(String)
                end
            end
    end 
end
