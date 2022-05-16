require('word')
require('rspec')

describe 'Word' do
  
  # before(:each) do
  #   Album.clear()
  # end

describe('#save') do
    it("saves a word") do
      # words = Word.new("Grant", nil)
      # words.save()
      # words2 = Word.new("Bill", nil) 
      # words2.save()
      # expect(Word.all).to(eq([words, words2]))
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

#   describe('#initialize') do
#     it('it will recongnize name and id') do
#       words = Word.new('tim')
#       words = Word.new(nil)
#     expect(Word.new()).to(eq('tim'))
#     expect(Word.new()).to(eq(1))
#   end
# end




end

