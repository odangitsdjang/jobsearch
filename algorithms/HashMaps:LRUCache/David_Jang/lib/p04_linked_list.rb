class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @store = []
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @store[0]
  end

  def last
    @store[@store.length-1]
  end

  def empty?
    @store.empty?
  end

  def get(key)

  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key,val)
    last_node = self.last
    last_node.next = new_node unless last_node.nil?
    @store.push(new_node)
    new_node.prev = last_node

  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
