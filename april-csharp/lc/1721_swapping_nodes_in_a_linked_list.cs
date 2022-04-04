// 264ms / 93.63% / 50.6MB / 39.71%

public ListNode SwapNodes(ListNode head, int k) {
  ListNode current = head;
  int i = 1;
  while (null != current.next) {
    current = current.next;
    ++i;
  }
  
  int target = i - k + 1;
  
  if (target == k) return head;
  
  if (target < k) {
    int t = k;
    k = target;
    target = t;
  }
  
  ListNode first;
  
  current = head;
  i = 0;
  while (++i < k) current = current.next;
  
  first = current;
  current = current.next;
  
  while (++i < target) current = current.next;
  
  int temp = current.val;
  current.val = first.val;
  first.val = temp;
  
  return head;
}
