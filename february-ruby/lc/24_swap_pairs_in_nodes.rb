# frozen_string_literal: true

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def swap_pairs(head)
  return nil if head.nil?
  return head if head.next.nil?
  ret = head.next
  current = head
  prev = nil
  until current.nil?
    first = current
    second = current.next
    if second.nil?
      prev.next = first
      return ret
    else
      prev.next = second unless prev.nil?
      current = second.next
      second.next = first
      prev = first
      
    end   
  end
  prev.next = nil
  ret
end


p swap_pairs(ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4)))))
p swap_pairs(ListNode.new(1, ListNode.new(2, ListNode.new(3))))