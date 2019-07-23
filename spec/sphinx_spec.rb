require 'rspec'
require 'sphinx'

describe '#sphinx' do
  it('gives true or false depending on input answer') do

    expect(q1('mother')).to(eq(true))
  end
end
