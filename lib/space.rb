class Space
  attr_reader :position, :fill, :guessed, :hit, :display
  def initialize(position)
    @position = position
    @fill = false
    @guessed = false
    @hit = false
    @display = '~'
  end

  def fill_space
    @fill = true
    @display = '^'
  end

  def guess
    @guessed = true
    @display = '?'
    if @fill
      @hit = true
      @display = '*'
    end
  end

end
