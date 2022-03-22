// 7ms / 100% / 42MB / 92.06%

class Solution {
  public String getSmallestString(int n, int k) {
      // 45ms
//         char[] result = new char[n];
//         if (k / n == 26) {
//             for (int i = 0; i < n; ++i) {
//                 result[i] = 'z';
//             }
//             return String.valueOf(result);
//         }

//         int target = k - n;
//         int i = -1;
//         while (++i < n - (int) Math.ceil(target / 25) - 1) {
//             result[i] = 'a';
//         }
//         result[i] = (char) (target % 25 + 97);
//         while (++i < n) {
//             result[i] = 'z';
//         }
//         return String.valueOf(result);
      
      int target = k - n;
      char[] result = new char[n];
      int index = n;
      while (target >= 25) {
          target -= 25;
          result[--index] = 'z';
      }
      if (index > 0) result[--index] = (char) (target + 97);
      while (--index >= 0) result[index] = 'a';
      return String.valueOf(result);
      
      // 26ms
      // if (k / n == 26) return "z".repeat(n);
      // int target = k - n;
      // return "a".repeat(n - (int) Math.ceil(target / 25) - 1) + ((char) ((target % 25) + 97)) + "z".repeat(target / 25);
  }
}