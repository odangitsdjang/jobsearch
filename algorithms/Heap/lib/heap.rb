class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    prc ||= Proc.new{|el1, el2| el1 <=> el2}
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    ret = @store.pop
    self.class.heapify_down(@store, 0)
    ret
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    self.class.heapify_up(@store, @store.length-1)
  end

  public
  def self.child_indices(len, parent_index)
    arr = []
    first = parent_index * 2 + 1 
    second = parent_index * 2 + 2 
    arr.push(first) if first <= len-1
    arr.push(second) if second <= len-1
    arr.empty? ? nil : arr
  end

  def self.parent_index(child_index)
    parent =  (child_index-1) / 2
    raise "root has no parent" if parent < 0 
    parent
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new{|el1, el2| el1 <=> el2}
    children = self.child_indices(len, parent_idx)
    return array if children.nil?

    # find the bigger child
    child_indx = children[0]
    if !children[1].nil? 
      case prc.call(array[children[0]], array[children[1]])
      when 1 
        child_indx += 1
      end
    end

    case prc.call(array[parent_idx], array[child_indx])
      when 1
        array[parent_idx], array[child_indx] = array[child_indx], array[parent_idx]
        return self.heapify_down(array, child_indx, len, &prc)
      else
        return array
    end
      
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new{|el1, el2| el1 <=> el2}
    return if child_idx == 0 
    parent = self.parent_index(child_idx) 
    case prc.call(array[parent],array[child_idx])
    when 1
      array[parent], array[child_idx] = array[child_idx], array[parent]
      return parent == 0 ? array : self.heapify_up(array, parent, len, &prc)
    else
      return array
    end
    
  end
end
