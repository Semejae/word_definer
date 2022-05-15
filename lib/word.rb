require('pry')

class Word
  @@name = {}

  def self.all()
    @@name.values
  end
end