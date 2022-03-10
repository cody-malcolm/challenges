// 4ms / 40.79% / 47.6MB / 46.24%

class Solution {
  public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
      ListNode head = new ListNode();
      int sum = l1.val + l2.val;
      head.val = sum > 9 ? sum - 10 : sum;
      ListNode current = head;
      while (null != l1.next && null != l2.next) {
          l1 = l1.next;
          l2 = l2.next;
          sum *= 0.1;
          sum += l1.val + l2.val;
          current.next = new ListNode(sum > 9 ? sum - 10 : sum);
          current = current.next;
      }
      while (null != l1.next) {
          l1 = l1.next;
          sum *= 0.1;
          sum += l1.val;
          current.next = new ListNode(sum > 9 ? sum - 10 : sum);
          current = current.next;
      }
      while (null != l2.next) {
          l2 = l2.next;
          sum *= 0.1;
          sum += l2.val;
          current.next = new ListNode(sum > 9 ? sum - 10 : sum);
          current = current.next;
      }
      if (sum > 9) current.next = new ListNode(1);
      return head;

  }
}