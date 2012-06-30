class Card
  def initialize(term, definition)
    @definition = definition
    @term = term
    @answered_correctly = false
  end

  def show_def
    @definition
  end
  
  def show_term
    @term
  end

  def correct?
    @answered_correctly

  end

  def correct!
    @answered_correctly = true
  end

  
end

