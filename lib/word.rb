require('pry')

class Word
  attr_reader :id, :name

  @@words = {}
  @@total_row = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_row += 1
  end

  def save()
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def self.all()
    @@words.values
  end
  
  # def ==(other_words)
  #   self.name.eql?(other_words.name)
  end
