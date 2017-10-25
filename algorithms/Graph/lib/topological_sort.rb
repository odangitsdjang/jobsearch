require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = []
  results = []
  vertices.each do |v|
    queue.unshift(v) if v.in_edges.empty? 
  end
  until queue.empty? 
    current = queue.pop
    results.push(current)
    current.out_edges.each do |e|
      destination_vertex = e.to_vertex
      destination_vertex.in_edges.delete(e)
      queue.push(destination_vertex) if destination_vertex.in_edges.empty?
    end
  end
  return [] if vertices.length != results.length
  results
end
