require('word')
require('rspec')
require('pry')

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end

describe('#initialize') do
    it('it will recongnize name and id') do
      words = Word.new('Grant', nil)
    expect(words.name).to(eq("Grant"))
  end
end

describe('#save') do
    it("saves a word") do
      words = Word.new("Grant", nil)
      words.save()
      words2 = Word.new("Bill", nil) 
      words2.save()
      expect(Word.all).to(eq([words, words2]))
    end
  end

describe(".all") do
  it("return empty array") do
    expect(Word.all()).to(eq([]))
  end
end

describe('#==') do
  it('if word matches another word') do
    words = Word.new('dog', nil)
    words2 = Word.new('dog', nil)
    expect(words).to(eq(words2))
  end
end

describe('.clear') do
  it('clear all words') do
    words = Word.new("Grant", nil)
    words.save()
    words2 = Word.new("Bill", nil) 
    words2.save()
    Word.clear()
    expect(Word.all).to(eq([]))
  end
end

describe('.find') do
  it('finds a word by id') do
    words = Word.new("Grant", nil)
    words.save()
    words2 = Word.new("Bill", nil) 
    words2.save()
    expect(Word.find(words.id)).to(eq(words))
  end
end 

describe('#update') do
  it('updates an words by id') do
    words = Word.new('Grant', nil)
    words.save()
    words.update('boby')
    expect(words.name).to(eq('boby'))
  end
end

describe('#delete') do
    it("deletes an album by id") do
      words = Word.new("Grant", nil)
      words.save()
      words2 = Word.new("Bill", nil) 
      words2.save()
      words.delete()
      expect(Word.all).to(eq([words2]))
    end
  end

  describe('#definition') do
  it("returns an word's definition") do
    Definition.clear()
    word = Word.new("grant", nil)
    word.save()
    definition = Definition.new("big", word.id, nil)
    definition.save()
    definition2 = Definition.new("small", word.id, nil)
    definition2.save()
    expect(word.definition).to(eq([definition, definition2]))
  end
end

end

