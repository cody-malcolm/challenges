# frozen_string_literal: true

require 'set'

def shortest_path_length(graph)
  # New to bitwise operations? Me too! Here's all you need to know for this problem:
  #   '<<' is the left shift operator, it shifts all numbers (in the binary representation) to the left
  #       and puts '0's to right of the previously rightmost digit. 
  #       Examples: 0b0001 (= 0d1) << 0b0010, 0b0001 << 2 = 0b0100, 0b0001 << 6 = 0b01000000, and so on
  #   '|' is the bitwise "OR" operation, it 'combines' two binary numbers such that:
  #       If bit 'i' of EITHER OR BOTH of the input numbers is 1, bit 'i' is 1, and otherwise bit 'i' is 0
  #       Examples: 0b0101 | 0b1010 = 0b1111, 0b0010 | 0b0110 = 0b0110, 0b0010 0110 | 0b0001 0000 = 0b0011 0110
  #
  # We want to represent the nodes we've already visited, but we don't care what order we visited them in
  # So, we represent each node in the graph with one bit, '0' if it hasn't been visited yet, and '1' if it has
  # So we start with a "bitmask" of 0000 0000 for a graph of 8 nodes, since no nodes are visited.
  # Say we start at node 4 (3rd index), then visit node 6, then node 3. We would update our bitmask like so:
  #   0b0000 0000 -> 0b0000 1000 -> 0b0010 1000 -> 0b0010 1100
  #   In code -> mask1 = (1 << 3) -> mask2 = mask1 | (1 << 5) -> mask3 = mask2 | (1 << 2) --> mask3 == 0b0010 1100
  # We continue this process until we get a mask that looks like 0b1111 1111.
  # Once we find this, we return the current count since all nodes have been visited

  finished = (1 << graph.size) - 1 # with graph.size == 4, is basically 0b10000 - 1 = 0b1111 -> our target mask

  seen = Set[] # will contain "tuples" of the form [mask, currentIndex], used to prevent unnecessarily looping
  # note -> A node visit order of 0->1->2->0 and 0->2->1->0 are redundant, but 0->1->2 and 0->2->1 are NOT.
  #   this is why we need to know the current index in addition to which nodes are visited already

  queue = [] # implement queue however you prefer, will contain "triples" of the form [count, mask, [adjacents]]
  # We'll use a BFS approach. Each triple in the queue will tell you how many edges traversed so far, the nodes 
  #   visited so far, and which nodes are adjacent to our current position

  # we can start from an arbitrary node, so we initialize the queue with each possible starting space
  graph.each_index do |i|
    queue.append([0, 1 << i , graph[i]]) # no edges travelled so far, a mask with one '1', and the adjacent nodes to this start point
  end

  until queue.empty?
    current = queue.shift # front of the queue
    count = current[0] + 1 # all adjacent nodes we visit will be another step
    mask = current[1] # all adjacent nodes will be based off the current mask

    current[2].each do |next_index| # for each adjacent node
      new_mask = (mask | (1 << next_index)) # add the adjacent node to the mask, assuming it hasn't already been visited
      return count if new_mask == finished # if that mean's we've visited all nodes, we're done, return the count

      looping = seen.add?([new_mask, next_index]) # add the new mask, and current index, to our seen set.
      # Ruby specific note: set.add?(i) will return nil if and only if 'i' already exists in the set

      queue.append([count, new_mask, graph[next_index]]) unless looping.nil? # add the count, new mask, and next index to the queue
      
    end

    # we've added all nodes adjacent to the current node to the queue, start on the next node
  end

  # in the case where there are no nodes, queue will be empty from the beginning, so just return 0
  return 0
end

p shortest_path_length([[1, 2, 3], [0], [0], [0]])
p shortest_path_length([[1], [0, 2, 4], [1, 3, 4], [2], [1, 2]])
p shortest_path_length([])