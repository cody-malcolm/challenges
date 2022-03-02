# frozen_string_literal: true

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# def my_insert(list_node, lists)
#   i = 0
#   first_val = list_node.val
#
#   i += 1 while i < lists.length && first_val > lists[i].val
#   lists.insert(i, list_node)
# end
#
# def merge_k_lists(lists)
#   lists.reject! { |e| e.nil? }
#   return [] if lists.empty?
#   lists.sort_by! { |n| n.val }
#
#   first_list = lists.shift
#   output = ListNode.new(first_list.val)
#   output_tail = output
#
#   first_list = first_list.next
#   my_insert(first_list, lists) unless first_list.nil?
#
#   until lists.empty?
#     this_list = lists.shift
#     this_node = ListNode.new(this_list.val)
#     output_tail.next = this_node
#     output_tail = output_tail.next
#     this_list = this_list.next
#     my_insert(this_list, lists) unless this_list.nil?
#   end
#
#   output
# end

def merge_k_lists(lists)
  return [] if lists.empty?

  arr = []
  lists.each do |list|
    until list.nil?
      arr << list.val
      list = list.next
    end
  end

  arr.sort
end

l1 = ListNode.new(1, ListNode.new(4, ListNode.new(5)))
l2 = ListNode.new(1, ListNode.new(3, ListNode.new(4)))
l3 = ListNode.new(2, ListNode.new(6))

p merge_k_lists([l1, l2, l3])
