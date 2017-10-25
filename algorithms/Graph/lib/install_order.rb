# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'

def install_order(arr)
  vertices = []
  vertex_hash = {}
  arr.each do |tuple|
    max = -99
    
    tuple.each do |value|
      max = value if value > max
    end
    
    (1..max).each do |v|
      vertex_hash[v] ||= Vertex.new(v)
    end

  end

  vertex_hash.values.each do |vertex|
    vertices.push(vertex)
  end

  arr.each do |tuple|
    to_vertex = vertex_hash[tuple[0]]
    from_vertex = vertex_hash[tuple[1]]
    Edge.new(from_vertex, to_vertex)
  end

  topological_sort(vertices).map {|vertex| vertex.value}
end
