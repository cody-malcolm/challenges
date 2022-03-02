// 0s / 100.0% / 40.2MB / 51.52%

class Solution {
  public String longestCommonPrefix(String[] strs) {
      if (strs.length == 0) return "";

      for (int i = 0; i < strs[0].length(); i++) {
          char c = strs[0].charAt(i);
          for (String s : strs) {
              if (s.length() == i || s.charAt(i) != c) return s.substring(0, i);
          }
      }
      return strs[0];
  }
}