// 1ms / 100% / 42MB / 74.73%

// Unlike the usual case, this is actually a "lot" faster than most solutions
// only 1.7% of solutions are 1ms (none are 0ms) and 8.31% are 2ms
// more than 50% of solutions are >5ms
// Also very complicated implementation, so there's that

class Solution {
  public String removeDuplicateLetters(String s) {
      int[] last = new int[26];
      int mask = 0;
      int curr;
      int count = 0;

      // find the last index of each character, and add them to the mask
      for (int i = 0; i < s.length(); ++i) {
          curr = s.charAt(i) - 97;
          last[curr] = i;
          mask |= (1 << curr);
      }

      // identify how many unique characters exist and clear the mask
      for (int i = 0; i < 26; ++i) {
          if ((mask & 1) == 1) ++count;
          mask >>= 1;
      }

      char[] stack = new char[count];
      int index = 0;
      int lastChar;

      // iterate through s
      // for this section, mask tracks what characters are currently on the stack
      for (int i = 0; i < s.length(); ++i) {
          curr = s.charAt(i) - 97;

          if (((mask >> curr) & 1) == 1) { // semantic
              continue;
          } else {
              // while there are more values in the stack, and they are "larger" than the current letter
              while (index > 0 && stack[index - 1] > s.charAt(i)) {
                  lastChar = stack[index - 1] - 97;

                  // if the larger letter will appear again, pop it
                  if (last[lastChar] > i) {
                      --index;
                      mask &= ~(1 << lastChar);
                  } else {
                      break; // from while loop, continue for loop
                  }
              }

              // push current value onto the stack
              stack[index++] = s.charAt(i);
              mask |= (1 << curr);

              if (index == count) break; // break early when stack is fully populated
          }
      }

      // construct and return results
      StringBuilder builder = new StringBuilder();
      for (int i = 0; i < stack.length; ++i) {
          builder.append(stack[i]);
      }

      return builder.toString();
  }
}