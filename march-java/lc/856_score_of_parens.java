// 0ms / 100% / 42.2MB / 24.45%

// This feels really inefficient, surprised it's 0ms
// worst case is O(n^2), but after consulting discussions, O(n) is possible - can track depth and count immediately

class Solution {
  public int helper(String s, int start, int end) {
      if (end - start == 2) {
          return 1;
      }
      int openParens = 1;
      int i = start;
      while (++i < s.length() && openParens > 0) {
          openParens += s.charAt(i) == '(' ? 1 : -1;
      }

      if (i == end) {
          return 2 * helper(s, start + 1, end - 1);
      } else {
          return helper(s, start, i) + helper(s, i, end);
      }
  }

  public int scoreOfParentheses(String s) {
      int openParens = 1;
      int score = 0;
      int last = 0;
      int i = 1;

      while (i < s.length()) {
          openParens += s.charAt(i) == '(' ? 1 : -1;

          if (openParens == 0) {
              score += helper(s, last, ++i);
              last = i;
          } else {
              ++i;
          }
      }
      return score;
  }
}