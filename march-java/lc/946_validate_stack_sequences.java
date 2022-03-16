// 3ms / ~80% / 41.4MB

// class Solution {
//   public boolean validateStackSequences(int[] pushed, int[] popped) {
//       Stack<Integer> stack = new Stack<>();

//       int j = 0;

//       for (int i = 0; i < pushed.length; i++) {
//           stack.push(pushed[i]);

//           while (!stack.isEmpty() && j < popped.length && stack.peek() == popped[j]) {
//               stack.pop();
//               j++;
//           }
//       }

//       return stack.isEmpty();
//   }
// }

// 1ms / 98.71% / 44.8MB / 58.54%

class Solution {
  public boolean validateStackSequences(int[] pushed, int[] popped) {
      int[] stack = new int[pushed.length];

      int idx = 0;
      int j = 0;
      
      for (int i = 0; i < pushed.length; i++) {
          stack[idx++] = pushed[i];

          while (idx > 0 && j < popped.length && stack[idx - 1] == popped[j]) {
              idx--;
              j++;
          }
      }

      return idx == 0;
  }
}