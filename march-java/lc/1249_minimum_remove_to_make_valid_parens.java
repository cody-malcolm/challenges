// 10ms / 98.05% / 49.4MB / 71.07%

class Solution {
  public String minRemoveToMakeValid(String s) {
      StringBuilder builder = new StringBuilder();
      int count = 0;
      int last = 0;
      
      for (int i = 0; i < s.length(); i++) {
          if (s.charAt(i) == ')' && count > 0) {
              count--;
          } else if (s.charAt(i) == '(') {
              count++;
          } else if (s.charAt(i) == ')') {
              builder.append(s, last, i);
              last = i + 1;
          }
      }
      
      builder.append(s.substring(last));
      last = builder.length() - 1;
      
      int idx;
      
      while (count > 0) {
          idx = builder.lastIndexOf("(", last);
          builder.deleteCharAt(idx);
          last = idx;
          count--;
      }

      return builder.toString();
  }
}