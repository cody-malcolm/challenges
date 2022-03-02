# frozen_string_literal: true

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def width_of_binary_tree(root)
  return 0 if root.nil?
  
  best = 0

  queue = []
  queue.append([root, 0])

  until queue.empty?
    max = 0
    min = Float::INFINITY
    queue.size.times do 
      nodeTuple = queue.shift
      node = nodeTuple[0]
      index = nodeTuple[1]

      max = [max, index].max
      min = [min, index].min      

      left = node.left
      right = node.right

      queue.push([left, 2 * index + 1]) unless left.nil?
      queue.push([right, 2 * (index + 1)]) unless right.nil?
    end
    best = [best, max - min + 1].max
  end
  best
end

p width_of_binary_tree(TreeNode.new(0, TreeNode.new(3, TreeNode.new(5, TreeNode.new(6))), TreeNode.new(2, nil, TreeNode.new(9, nil, TreeNode.new(7)))))
