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
  
  def ==(other_words)
    self.name() == other_words.name()
  end

  def self.clear
    @@words = {}
    @@total_row = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(new_name)
    @name = new_name
  end

  def delete
    @@words.delete(self.id)
  end

  def definition
    Definition.find_by_word(self.id)
  end
end
