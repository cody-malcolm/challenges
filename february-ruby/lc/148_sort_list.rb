# frozen_string_literal: true
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def sort_list(head)
  return nil if head.nil?
  counts = Array.new(200001) { 0 }
  current = head
  until current.nil?
    counts[current.val + 100000] += 1
    current = current.next
  end

  i = 0;
  i += 1 while counts[i].zero?

  new_head = ListNode.new(i - 100000)
  current = new_head
  counts[i] -= 1
  until i == 200001
    until counts[i].zero?
      counts[i] -= 1
      current.next = ListNode.new(i - 100000)
      current = current.next
    end
    i += 1
  end
  new_head
end

p sort_list(ListNode.new(4, ListNode.new(2, ListNode.new(1, ListNode.new(3)))))

