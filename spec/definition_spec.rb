require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
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

  describe('.all') do
    it("returns a list of all definition") do
      definition = Definition.new("Giant", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Small", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definition") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a defintion") do
      definition = Definition.new("Big", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

end