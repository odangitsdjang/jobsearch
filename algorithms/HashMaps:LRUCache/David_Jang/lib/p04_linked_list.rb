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
  include Enumerable
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
    x = @store.select {|node| node.key == key }[0]
    x ? x.val : nil 
  end

  def include?(key)
    @store.any? { |node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key,val)
    last_node = self.last
    last_node.next = new_node unless last_node.nil?
    @store.push(new_node)
    new_node.prev = last_node

  end

  def update(key, val)
    @store.each {|node| node.val = val if node.key == key }
  end

  def remove(key)
    @store.each do |node| 
      if node.key == key  
        node.prev.next = node.next unless node.prev.nil?
        node.next.prev = node.prev unless node.next.nil?
        node.val = nil
        node.prev = nil
        node.next = nil
      end
    end
  end

  def each
    @store.each { |node| yield node }
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
