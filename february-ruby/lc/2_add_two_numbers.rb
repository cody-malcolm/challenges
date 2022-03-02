# frozen_string_literal: true

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def add_two_numbers(l1, l2)
  next_num = l1.val + l2.val

  currentl1 = l1.next
  currentl2 = l2.next

  res = ListNode.new(next_num % 10)
  current_head = res

  until currentl1.nil? || currentl2.nil?
    next_num = currentl1.val + currentl2.val + next_num / 10
    next_node = ListNode.new(next_num % 10)
    current_head.next = next_node
    current_head = next_node
    currentl1 = currentl1.next
    currentl2 = currentl2.next
  end

  until currentl1.nil?
    next_num = currentl1.val + next_num / 10
    next_node = ListNode.new(next_num % 10)
    current_head.next = next_node
    current_head = next_node
    currentl1 = currentl1.next
  end

  until currentl2.nil?
    next_num = currentl2.val + next_num / 10
    next_node = ListNode.new(next_num % 10)
    current_head.next = next_node
    current_head = next_node
    currentl2 = currentl2.next
  end

  current_head.next = ListNode.new(1) if next_num / 10 == 1

  res
end

list11 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
list12 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))

p add_two_numbers(list11, list12)

list21 = ListNode.new(0)
list22 = ListNode.new(0)

p add_two_numbers(list21, list22)

list31 = ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9))))))
list32 = ListNode.new(9, ListNode.new(9, ListNode.new(9)))

p add_two_numbers(list31, list32)
