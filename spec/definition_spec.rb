require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#definition' do

  before(:each) do
    Word.clear()
    # Definition.clear()
    @word = Word.new('grant', nil)
    @word.save()
  end


    describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("grant", @word.id, nil)
      definition2 = Definition.new("grant", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

end