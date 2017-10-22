class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent, :direction
  def initialize(value)
    @value = value
    @left, @right = nil
    @parent = nil
    # direction specifies which direction it came down from the parent
    @direction = nil
  end
end
