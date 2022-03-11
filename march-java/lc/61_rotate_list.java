// 0ms / 100% / 41.8MB / 61.18%

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
  public ListNode rotateRight(ListNode head, int k) {
      if (null == head) return null;
      int numNodes = 0;
      ListNode current = head;
      while (null != current) {
          numNodes++;
          current = current.next;
      }
      int steps = k % numNodes;
      if (steps == 0) return head;
      current = head;
      
      int i = 0;
      while (++i < numNodes - steps) current = current.next;
      ListNode newHead = current.next;
      current.next = null;
      current = newHead;
      while (null != current.next) current = current.next;
      current.next = head;

      return newHead;
  }
}