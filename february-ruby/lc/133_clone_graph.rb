# frozen_string_literal: true

class Node
    attr_accessor :val, :neighbors
    def initialize(val = 0, neighbors = nil)
		  @val = val
		  @neighbors = neighbors.nil? ? [] : neighbors
    end
end

def cloneGraph(node)
  return nil if node.nil?
  return new Node(1) if node.neighbors.nil?
  nodes = Array.new(101)
  nodes[1] = node
  neighbs = Array.new(101)
  neighbs[1] = node.neighbors.map { |n| n.val } unless node.neighbors.nil?
  indexes = [1]
  found = []

  until indexes.empty?
    current_index = indexes.pop
    for neighbor in nodes[current_index].neighbors do
      current_val = neighbor.val
      nodes[current_val] = neighbor
      neighbs[current_val] = neighbor.neighbors.map { |n| n.val } unless neighbor.neighbors.nil?
      indexes.append(current_val) unless found.include?(current_val)
      found.append(current_val)
    end
  end

  copies = []
  for i in (0..100) do
    copies[i] = nodes[i].nil? ? nil : Node.new(i)
  end

  for i in (0..100) do
    next if copies[i].nil?
    for num in neighbs[i] do
      copies[i].neighbors.append(copies[num])
    end
  end

  copies[1]
end


cloneGraph(Node.new(1, [Node.new(2), Node.new(3)]))