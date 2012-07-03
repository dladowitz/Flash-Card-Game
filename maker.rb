class Maker

  def initialize
    @file  = File.open("new_cards.txt", "a")

    # Write everything to disk immediately
    # http://www.ruby-doc.org/core-1.9.3/IO.html#method-i-sync-3D
    @file.sync = true
  end

  def add_new_card(string)
    @file.write(string)
  end
end