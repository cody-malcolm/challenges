// 2ms / 79.61% / 42.3MB / 18.12%
// identical stats with Stack

class Solution {
    public boolean isValid(String s) {
        ArrayDeque stack = new ArrayDeque();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '(': case '[': case '{':
                    stack.push(c);
                    break;
                case ')':
                    if (stack.isEmpty()) return false;
                    if ((char) stack.poll() != '(') return false;
                    break;
                case ']':
                    if (stack.isEmpty()) return false;
                    if ((char) stack.poll() != '[') return false;
                    break;
                case '}':
                    if (stack.isEmpty()) return false;
                    if ((char) stack.poll() != '{') return false;
                    break;
            }
        }
        return stack.isEmpty();
    }
}

// 0ms / 100% / 42MB / 32.50%

class Solution {
  public boolean isValid(String s) {
      char[] stack = new char[s.length()];
      int index = 0;
      for (int i = 0; i < s.length(); i++) {
          char c = s.charAt(i);
          switch (c) {
              case '(': case '[': case '{':
                  stack[index++] = c;
                  break;
              case ')':
                  if (index-- == 0) return false;
                  if (stack[index] != '(') return false;
                  break;
              case ']':
                  if (index-- == 0) return false;
                  if (stack[index] != '[') return false;
                  break;
              case '}':
                  if (index-- == 0) return false;
                  if (stack[index] != '{') return false;
                  break;
          }
      }
      return index == 0;
  }
}