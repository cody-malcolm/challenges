# frozen_string_literal: true

def max_depth(root)
  root.nil? ? 0 : [1 + max_depth(root.left), 1 + max_depth(root.right)].max
end

root1 = [3,9,20,nil,nil,15,7]
root2 = [1,nil,2]
root3 = []
root4 = [8]

p max_depth(root1)
p max_depth(root2)
p max_depth(root3)
p max_depth(root4)
