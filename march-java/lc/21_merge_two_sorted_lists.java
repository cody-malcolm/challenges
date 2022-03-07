// 1ms / 71.98% / 42.4MB / 46.25%

// big win! no mistakes and < 5 minutes to write
class Solution { 
  public class ListNode { 
      int val;
      ListNode next;
      ListNode() {}
      ListNode(int val) { this.val = val; }
      ListNode(int val, ListNode next) { this.val = val; this.next = next; }
  }
  
  public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
      if (null == list1) return list2;
      if (null == list2) return list1;
      
      ListNode head;
      if (list1.val < list2.val) {
          head = list1;
          list1 = list1.next;
      } else {
          head = list2;
          list2 = list2.next;
      }        
      ListNode current = head;
      
      while (null != list1 && null != list2) {
          if (list1.val < list2.val) {
              current.next = list1;
              list1 = list1.next;
          } else {
              current.next = list2;
              list2 = list2.next;                
          }
          current = current.next;
      }
      
      while (null != list1) {
          current.next = list1;
          list1 = list1.next;
          current = current.next;
      }

      while (null != list2) {
          current.next = list2;
          list2 = list2.next;
          current = current.next;
      }

      return head;
  }
}