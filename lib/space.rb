class Space
  attr_reader :position, :fill, :guessed
  def initialize(position)
    @position = position
    @fill = false
    @guessed = false
  end

  def fill_space
    @fill = true
  end

  def guess
    @guessed = true
  end
end
 
